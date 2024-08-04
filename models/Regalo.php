<?php

namespace Model;

class Regalo extends ActiveRecord
{
    protected static $tabla = 'regalos';
    protected static $columnasDB = ['id', 'nombre'];

    public $id;
    public $nombre;

    public function __construct($args = [])
    {
        $this->id = $args['id'] ?? null;
        $this->nombre = $args['nombre'] ?? '';
    }

    public function validar_regalo()
    {
        switch (true) {
            case empty($this->nombre):
                self::$alertas['error'][] = "El nombre es Obligatorio";
                break;
            case !preg_match('/^[a-zA-ZáéíóúüñÁÉÍÓÚÜÑ\s\.\-\,0-9]+$/', $this->nombre):
                self::$alertas['error'][] = "El nombre solo debe contener letras y espacios.";
                break;
        }
        return self::$alertas;
    }
}
