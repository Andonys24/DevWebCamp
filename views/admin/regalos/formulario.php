<fieldset class="formulario__fieldset">
    <legend class="formulario__legend">Información del Regalo</legend>

    <div class="formulario__campo">
        <label for="nombre" class="formulario__label">Nombre del Regalo</label>
        <input type="text" class="formulario__input" id="nombre" name="nombre" placeholder="Nombre Regalo" value="<?php echo $regalo->nombre ?? ''; ?>">
    </div>
</fieldset>