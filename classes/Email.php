<?php

namespace Classes;

use PHPMailer\PHPMailer\PHPMailer;

class Email
{

    public $email;
    public $nombre;
    public $token;

    public function __construct($email, $nombre, $token)
    {
        $this->email = $email;
        $this->nombre = $nombre;
        $this->token = $token;
    }

    public function enviarConfirmacion()
    {

        // create a new object
        $mail = new PHPMailer();
        $mail->isSMTP();
        $mail->Host = $_ENV['EMAIL_HOST'];
        $mail->SMTPAuth = true;
        $mail->Port = $_ENV['EMAIL_PORT'];
        $mail->Username = $_ENV['EMAIL_USER'];
        $mail->Password = $_ENV['EMAIL_PASS'];

        $mail->setFrom('cuentas@devwebcamp.com');
        $mail->addAddress($this->email, $this->nombre);
        $mail->Subject = 'Confirma tu Cuenta en DevWebCamp';

        // Set HTML
        $mail->isHTML(TRUE);
        $mail->CharSet = 'UTF-8';

        $contenido = '<html>';
        $contenido .= '<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; padding: 20px;">';
        $contenido .= '<div style="max-width: 600px; margin: 0 auto; background-color: #fff; padding: 20px; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">';
        $contenido .= '<h2 style="color: #007bff;">¡Bienvenido a DevWebCamp!</h2>';
        $contenido .= '<p>Hola <strong>' . $this->nombre . '</strong>,</p>';
        $contenido .= '<p>Gracias por registrarte en DevWebCamp. Para completar tu registro, por favor confirma tu cuenta haciendo clic en el siguiente enlace:</p>';
        $contenido .= '<p style="text-align: center; margin-top: 20px;"><a style="display: inline-block; padding: 10px 20px; background-color: #007bff; color: #fff; text-decoration: none; border-radius: 3px;" href="' . $_ENV['HOST'] . '/confirmar-cuenta?token=' . $this->token . '">Confirmar Cuenta</a></p>';
        $contenido .= '<p>Si no has creado esta cuenta, puedes ignorar este mensaje.</p>';
        $contenido .= '<p>Gracias,<br>El equipo de DevWebCamp</p>';
        $contenido .= '</div>';
        $contenido .= '</body>';
        $contenido .= '</html>';
        $mail->Body = $contenido;

        //Enviar el mail
        $mail->send();
    }

    public function enviarInstrucciones()
    {

        // create a new object
        $mail = new PHPMailer();
        $mail->isSMTP();
        $mail->Host = $_ENV['EMAIL_HOST'];
        $mail->SMTPAuth = true;
        $mail->Port = $_ENV['EMAIL_PORT'];
        $mail->Username = $_ENV['EMAIL_USER'];
        $mail->Password = $_ENV['EMAIL_PASS'];

        $mail->setFrom('cuentas@devwebcamp.com');
        $mail->addAddress($this->email, $this->nombre);
        $mail->Subject = 'Reestablecimiento de Contraseña en DevWebCamp';

        // Set HTML
        $mail->isHTML(TRUE);
        $mail->CharSet = 'UTF-8';

        $contenido = '<html>';
        $contenido .= '<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; padding: 20px;">';
        $contenido .= '<div style="max-width: 600px; margin: 0 auto; background-color: #fff; padding: 20px; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">';
        $contenido .= '<h2 style="color: #007bff;">Reestablecer Contraseña en DevWebCamp</h2>';
        $contenido .= '<p>Hola <strong>' . $this->nombre . '</strong>,</p>';
        $contenido .= '<p>Has solicitado reestablecer tu contraseña en DevWebCamp. Para continuar, haz clic en el siguiente enlace:</p>';
        $contenido .= '<p style="text-align: center; margin-top: 20px;"><a style="display: inline-block; padding: 10px 20px; background-color: #007bff; color: #fff; text-decoration: none; border-radius: 3px;" href="' . $_ENV['HOST'] . '/recuperar?token=' . $this->token . '">Reestablecer Contraseña</a></p>';
        $contenido .= '<p>Si no solicitaste este cambio, puedes ignorar este mensaje.</p>';
        $contenido .= '<p>Gracias,<br>El equipo de DevWebCamp</p>';
        $contenido .= '</div>';
        $contenido .= '</body>';
        $contenido .= '</html>';
        $mail->Body = $contenido;

        //Enviar el mail
        $mail->send();
    }
}
