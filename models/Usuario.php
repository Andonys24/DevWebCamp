<?php

namespace Model;

class Usuario extends ActiveRecord
{
    protected static $tabla = 'usuarios';
    protected static $columnasDB = ['id', 'nombre', 'apellido', 'email', 'password', 'confirmado', 'token', 'admin'];

    public $id;
    public $nombre;
    public $apellido;
    public $email;
    public $password;
    public $password2;
    public $confirmado;
    public $token;
    public $admin;

    public $password_actual;
    public $password_nuevo;


    public function __construct($args = [])
    {
        $this->id = $args['id'] ?? null;
        $this->nombre = $args['nombre'] ?? '';
        $this->apellido = $args['apellido'] ?? '';
        $this->email = $args['email'] ?? '';
        $this->password = $args['password'] ?? '';
        $this->password2 = $args['password2'] ?? '';
        $this->confirmado = $args['confirmado'] ?? 0;
        $this->token = $args['token'] ?? '';
        $this->admin = $args['admin'] ?? '';
    }

    // Validar el Login de Usuarios
    public function validar_login()
    {
        switch (true) {
            case $this->validar_email():
                break;
            case empty($this->password):
                self::$alertas['error'][] = 'El Password es Obligatorio.';
                break;
        }
        return self::$alertas;
    }

    // Validación para cuentas nuevas
    public function validar_cuenta()
    {
        switch (true) {
            case $this->validar_nombre_apellido($this->nombre, 'Nombre'):
                break;
            case $this->validar_nombre_apellido($this->apellido, 'Apellido'):
                break;
            case $this->validar_email():
                break;
            case $this->validar_password($this->password):
                break;
            case $this->password !== $this->password2:
                self::$alertas['error'][] = 'Los password son diferentes';
                break;
        }
        return self::$alertas;
    }

    public function validar_nombre_apellido($campo, $nombre_campo)
    {
        // Definir límites de caracteres
        $limite_caracteres = 60;

        switch (true) {
            case empty($campo):
                self::$alertas['error'][] = "El $nombre_campo es Obligatorio";
                break;
            case strlen($campo) > $limite_caracteres:
                self::$alertas['error'][] = "El $nombre_campo no puede tener más de $limite_caracteres caracteres.";
                break;
            case !preg_match('/^[a-zA-ZáéíóúüñÁÉÍÓÚÜÑ\s]+$/', $campo):
                self::$alertas['error'][] = "El $nombre_campo solo debe contener letras y espacios.";
                break;
        }
        return self::$alertas;
    }


    // Valida un email
    public function validar_email()
    {
        switch (true) {
            case empty($this->email):
                self::$alertas['error'][] = 'El Email es Obligatorio.';
                break;
            case strlen($this->email) > 255:
                self::$alertas['error'][] = 'El Email no puede tener más de 255 caracteres.';
                break;
            case !filter_var($this->email, FILTER_VALIDATE_EMAIL):
                self::$alertas['error'][] = 'El Email no es Valido.';
                break;
        }
        return self::$alertas;
    }

    // Valida el Password 
    public function validar_password($password)
    {
        switch (true) {
            case empty($password):
                self::$alertas['error'][] = 'El Password es Obligatorio.';
                break;
            case strlen($password) < 8:
                self::$alertas['error'][] = 'El Password debe tener al menos 8 caracteres.';
                break;
            case !preg_match('/[a-z]/', $password) || !preg_match('/[A-Z]/', $password):
                self::$alertas['error'][] = 'La Contraseña debe contener al menos una letra mayúscula y una letra minúscula.';
                break;
            case !preg_match('/\d/', $password):
                self::$alertas['error'][] = 'La Contraseña debe contener al menos un número.';
                break;
            case !preg_match('/[^a-zA-Z\d\s]/', $password):
                self::$alertas['error'][] = 'La Contraseña debe contener al menos un carácter especial.';
                break;
        }
        return self::$alertas;
    }

    public function nuevo_password(): array
    {
        switch (true) {
            case empty($this->password_actual):
                self::$alertas['error'][] = 'El Password Actual es Obligatorio';
                break;
            case $this->validar_password($this->password_nuevo):
                break;
            case $this->password_nuevo !== $this->password2:
                self::$alertas['error'][] = 'Los password no coinciden';
                break;
            case $this->password_actual === $this->password_nuevo:
                self::$alertas['error'][] = 'La nueva contraseña debe ser diferente a la actual';
                break;
        }
        return self::$alertas;
    }

    // Comprobar el password
    public function comprobar_password(): bool
    {
        return password_verify($this->password_actual, $this->password);
    }

    // Hashea el password
    public function hashPassword(): void
    {
        $this->password = password_hash($this->password, PASSWORD_BCRYPT);
    }

    // Generar un Token
    public function crearToken(): void
    {
        $this->token = uniqid();
    }
}
