<?php

namespace Model;

class Evento extends ActiveRecord
{
    protected static $tabla = 'eventos';
    protected static $columnasDB = ['id', 'nombre', 'descripcion', 'disponibles', 'categoria_id', 'dia_id', 'hora_id', 'ponente_id'];

    public $id;
    public $nombre;
    public $descripcion;
    public $disponibles;
    public $categoria_id;
    public $dia_id;
    public $hora_id;
    public $ponente_id;

    public function __construct($args = [])
    {
        $this->id = $args['id'] ?? null;
        $this->nombre = $args['nombre'] ?? '';
        $this->descripcion = $args['descripcion'] ?? '';
        $this->disponibles = $args['disponibles'] ?? '';
        $this->categoria_id = $args['categoria_id'] ?? null;
        $this->dia_id = $args['dia_id'] ?? null;
        $this->hora_id = $args['hora_id'] ?? null;
        $this->ponente_id = $args['ponente_id'] ?? null;
    }

    public function validar()
    {
        switch (true) {
            case empty($this->nombre):
                self::$alertas['error'][] = "El nombre es Obligatorio";
                break;
            case !preg_match('/^[a-zA-ZáéíóúüñÁÉÍÓÚÜÑ\s\.\-\,0-9]+$/', $this->nombre):
                self::$alertas['error'][] = "El nombre solo debe contener letras y espacios.";
                break;
            case empty($this->descripcion):
                self::$alertas['error'][] = "La descripción es Obligatoria";
                break;
            case !preg_match('/^[a-zA-ZáéíóúüñÁÉÍÓÚÜÑ\s\.\,0-9"\'\(\)\+\-\*\/]+$/', $this->descripcion):
                self::$alertas['error'][] = "La descripción tiene algun caracter no permitido";
                break;
            case $this->validar_entero($this->categoria_id, 'La categoria'):
                break;
            case $this->validar_entero($this->dia_id, 'El dia'):
                break;
            case $this->validar_entero($this->hora_id, 'La hora'):
                break;
            case $this->validar_entero($this->ponente_id, 'El ponente'):
                break;
            case $this->validar_entero($this->disponibles, 'Los lugares disponibles'):
                break;
        }
        return self::$alertas;
    }

    public function validar_entero($campo, $nombre_campo)
    {
        switch (true) {
            case empty($campo):
                self::$alertas['error'][] = "$nombre_campo es Obligatorio";
                break;
            case !filter_var($campo, FILTER_VALIDATE_INT):
                self::$alertas['error'][] = "$nombre_campo debe ser un número entero.";
                break;
        }
        return self::$alertas;
    }
}
