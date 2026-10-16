<?php
// Mailtrap Email Sending SMTP settings.
// Set these environment variables in your PHP/server environment.
// Use a verified sender address/domain in your Mailtrap account.
return [
    'host' => getenv('SHOESKOPO_SMTP_HOST') ?: 'live.smtp.mailtrap.io',
    'port' => (int)(getenv('SHOESKOPO_SMTP_PORT') ?: 587),
    'username' => getenv('SHOESKOPO_SMTP_USERNAME') ?: '',
    'password' => getenv('SHOESKOPO_SMTP_PASSWORD') ?: '',
    'from_email' => getenv('SHOESKOPO_MAIL_FROM') ?: '',
    'from_name' => getenv('SHOESKOPO_MAIL_FROM_NAME') ?: 'Shoeskopo',
    'enabled' => filter_var(getenv('SHOESKOPO_MAIL_ENABLED') ?: 'false', FILTER_VALIDATE_BOOLEAN),
];
