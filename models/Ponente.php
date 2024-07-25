<?php

namespace Model;


class Ponente extends ActiveRecord
{
    protected static $tabla = 'ponentes';
    protected static $columnasDB = ['id', 'nombre', 'apellido', 'ciudad', 'pais', 'imagen', 'tags', 'redes'];

    public $id;
    public $nombre;
    public $apellido;
    public $ciudad;
    public $pais;
    public $imagen;
    public $tags;
    public $redes;

    public function __construct($args = [])
    {
        $this->id = $args['id'] ?? null;
        $this->nombre = $args['nombre'] ?? '';
        $this->apellido = $args['apellido'] ?? '';
        $this->ciudad = $args['ciudad'] ?? '';
        $this->pais = $args['pais'] ?? '';
        $this->imagen = $args['imagen'] ?? '';
        $this->tags = $args['tags'] ?? '';
        $this->redes = $args['redes'] ?? '';
    }

    public function validar_ponente()
    {
        switch (true) {
            case $this->validar_string($this->nombre, 'Nombre', 60):
                break;
            case $this->validar_string($this->apellido, 'Apellido', 60):
                break;
            case $this->validar_string($this->ciudad, 'Ciudad', 60):
                break;
            case $this->validar_string($this->pais, 'País', 60):
                break;
            case empty($this->imagen):
                self::$alertas['error'][] = "La imagen es Obligatoria";
                break;
            case empty($this->tags):
                self::$alertas['error'][] = "Los tags son Obligatorios";
                break;
        }
        return self::$alertas;
    }

    public function validar_string($campo, $nombre_campo, $limite)
    {

        switch (true) {
            case empty($campo):
                self::$alertas['error'][] = "El $nombre_campo es Obligatorio";
                break;
            case strlen($campo) > $limite:
                self::$alertas['error'][] = "El $nombre_campo no puede tener más de $limite caracteres.";
                break;
            case !preg_match('/^[a-zA-ZáéíóúüñÁÉÍÓÚÜÑ\s]+$/', $campo):
                self::$alertas['error'][] = "El $nombre_campo solo debe contener letras y espacios.";
                break;
        }
        return self::$alertas;
    }
}
