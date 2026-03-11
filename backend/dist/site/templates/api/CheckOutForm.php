<?php namespace ProcessWire;

require_once __DIR__ . "/Helper.php";

class CheckOutForm {
  public static function submit($data) {
    Helper::setLanguage();

    $sanitizer = wire('sanitizer');

    // sanitize form fields
    $form = [];
    $title  = $form['title']  = $sanitizer->text($data->title ?? '');
    $firstName  = $form['firstName']  = $sanitizer->text($data->firstName ?? '');
    $lastName  = $form['lastName']  = $sanitizer->text($data->lastName ?? '');
    $pronouns  = $form['pronouns']  = $sanitizer->text($data->pronouns ?? '');
    $email = $form['email'] = $sanitizer->email($data->email ?? '');
    $message = $form['message'] = $sanitizer->textarea($data->message ?? '');

    // safety net: additional validation even though frontend already uses required fields to prevent empty fields, honeypot field and timer to catch bots that fill all fields and fill them fast
    // validation
    $required = ['email','firstName','lastName'];

    foreach($required as $field) {
      if(empty($form[$field])) {
        return self::error('Missing required fields');
      }
    }
    // spam protection
    // simple honeypot spam protection
    if(!empty($data->website)) {
      return self::error('Spam detected');
    }

    // simple timer-based spam protection, if form is submitted too fast (e.g. within 5 seconds), it might be a bot. do not send.
    $started = intval($data->started ?? 0);
    $elapsed = time() - $started;

    if($started === 0 || $elapsed < 3) {
      return self::error('Spam detected');
    }

    // send mail
    $sent = false;

    if (wire('config')->_mailTo) {
      try {
        $mail = wireMail();
        $mail->to(wire('config')->_mailTo)
          ->from(wire('config')->_mailFrom)
          ->replyTo($email) // set reply-to to the email of the user who submitted the form, so that you can easily reply to them without having to copy their email address from the form data in the received email
          ->subject("Neue Anfrage: $title");
        $bodyHTML = wireRenderFile(
          wire('config')->paths->templates . 'mail/default.php',
          [
            'title' => "Hallo Carolin,",
            'body' => "du hast eine neue Anfrage von $firstName $lastName für ein(e) $title erhalten. Hier sind die von $firstName gesendeten Daten:",
            'form' => $form,
            'greeting' => "Liebe Grüße,<br>deine Webseite :)"
          ]
        );

        $mail->bodyHTML($bodyHTML);

        if ($mail->send() > 0) {
          $sent = true;
        }
      } catch(\Exception $e) {
        wire('log')->save('mail', $e->getMessage());
      }

      // send auto-response to user
      try {
        // __(..) is the translation function of ProcessWire so it can translate into the visitors language with Helper::setLanguage() - even though in this case the language is already set to German, it's good practice to wrap any user-facing text in the translation function
        $subject = __("Danke für deine Anfrage");
        $salutation = __("Hallo $firstName,");
        $body = __("deine Anfrage für ein(e) $title habe ich erhalten. Ich danke dir von Herzen dafür und melde mich so schnell wie möglich bei dir, um Weiteres zu besprechen. In der Zwischenzeit kannst du gerne auf meiner Webseite stöbern, um mehr über mich und meine Arbeit zu erfahren.");
        $greeting = __('Viele Grüße,');
        $bodyHTML = wireRenderFile(
          wire('config')->paths->templates . 'mail/auto-respond.php',
          [
            'subject' => $subject,
            'salutation' => $salutation,
            'body' => $body,
            'greeting' => $greeting
          ]
        );

        wireMail()
          ->to($email)
          ->from(wire('config')->_mailFrom)
          ->replyTo(wire('config')->_replyTo)
          ->subject($subject)
          ->bodyHTML($bodyHTML)
          ->send();

      } catch(\Exception $e) {
        wire('log')->save('mail', "Failed to send auto-response to $email: " . $e->getMessage());
      }
    }

    Helper::unsetLanguage();

    return $sent
      ? ['status' => 'success', 'message' => 'Check-Out submitted successfully']
      : ['status' => 'error', 'message' => 'Mail could not be sent'];
  }

  private static function error($message) {
    return [
      'status' => 'error',
      'message' => $message
    ];
  }
}
