<?php namespace ProcessWire; ?>

<?php
// Map form keys to nicer labels
$labels = [
  'title' => 'Service / Produkt',
  'email' => 'E-Mail',
  'message' => 'Nachricht',
  'firstName' => 'Vorname',
  'lastName' => 'Nachname',
  'pronouns' => 'Pronomen'
];

$linkStyle = 'color: inherit;text-decoration: underline; text-decoration-color: #fcc100;';
?>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title><?php echo $title; ?></title>
  </head>
  <body style='font-family:"IBM Plex Serif", Georgia, "Times New Roman", serif; color: #333; line-height: 1.5;font-size: 14px;'>
    <p style='margin-top: 30px;'><?php echo $title; ?></p>
    <p><?php echo $body; ?></p>

    <?php if (isset($form)): ?>
      <table style='width: 100%; cellspacing="0"; margin-top: 20px;'>
        <?php foreach($form as $key => $value): ?>
          <tr>
            <th class='label' style='width: 30%; text-align: right; font-weight: bold; padding: 5px 10px 5px 0; vertical-align: top;'>
              <?php echo $labels[$key] ?? ucfirst($key); ?>
            </th>
            <td class='value' style='width: 70%; padding: 5px 0 5px 0;'>
              <?php
                // convert email addresses into styled mailto links
                if (filter_var($value, FILTER_VALIDATE_EMAIL)) {
                  echo '<a href="mailto:' . htmlspecialchars($value) . '" style="' . $linkStyle . '">' . htmlspecialchars($value) . '</a>';
                } else {
                  echo nl2br(htmlspecialchars($value));
                }
              ?>
            </td>
          </tr>
        <?php endforeach; ?>
      </table>
    <p style='margin-top: 30px;'><?php echo $greeting; ?></p>
    <?php endif; ?>
  </body>
</html>
