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

     // validation
    if(!$email || !$firstName || !$lastName || !$message) {
      return [
        'status' => 'error',
        'message' => 'Missing required fields'
      ];
    }

    // honeypot goes here later

    $sent = false;

    // Send mail
    if (wire('config')->_mailTo) {
      try {
        $mail = wireMail();
        $mail->to(wire('config')->_mailTo)
          ->from(wire('config')->_mailFrom)
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
        $numSent = $mail->send();

        if ($numSent > 0) {
          $sent = true;
        } else {
          wire('log')->save('mail', "Failed to send mail to $email");
        }
      } catch(\Exception $e) {
        wire('log')->save('mail', $e->getMessage());
      }

      // --- send auto response to user ---
      try {
        $autoRespond = wireMail();
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

        $autoRespond->to($email)
          ->from(wire('config')->_mailFrom)
          ->replyTo(wire('config')->_replyTo)
          ->subject($subject)
          ->bodyHTML($bodyHTML);

        $autoRespond->send();

      } catch(\Exception $e) {
        wire('log')->save('mail', "Failed to send auto-response to $email: " . $e->getMessage());
      }
    }

    Helper::unsetLanguage();

    if($sent) {
      return [
        'status' => 'success',
        'message' => 'Check-Out submitted successfully'
      ];
    }

    return [
      'status' => 'error',
      'message' => 'Mail could not be sent'
    ];
  }
}
