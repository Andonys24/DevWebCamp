<h1 class="dashboard__heading"><?php echo $titulo; ?></h1>

<div class="etiquetas">
    <div class="etiqueta">
        <h4 class="etiqueta__heading">Total Ingresos</h4>
        <p class="etiqueta__texto" id="total"></p>
    </div>

    <div class="etiqueta">
        <h4 class="etiqueta__heading">Usuarios Registrados</h4>
        <p class="etiqueta__texto"><?php echo $registros; ?></p>
    </div>

    <div class="etiqueta">
        <h4 class="etiqueta__heading">Total Eventos</h4>
        <p class="etiqueta__texto" id="total-eventos"></p>
    </div>
    
    <div class="etiqueta">
        <h4 class="etiqueta__heading">Total Ponentes</h4>
        <p class="etiqueta__texto"><?php echo $ponentes; ?></p>
    </div>
</div>

<div class="bloques">
    <div class="bloques__grid">
        <div class="bloque">
            <h3 class="bloque__heading">Ingresos</h3>
            <canvas id="ingresos-grafica" class="bloque__grafico"></canvas>
        </div>
        <div class="bloque">
            <h3 class="bloque__heading">Regalos Solicitados</h3>
            <canvas id="regalos-grafica" class="bloque__grafico"></canvas>
        </div>
        <div class="bloque">
            <h3 class="bloque__heading">Eventos con Menos lugares disponibles</h3>
            <canvas id="menos_disponibles-grafica" class="bloque__grafico"></canvas>
        </div>

        <div class="bloque">
            <h3 class="bloque__heading">Eventos con Mas lugares disponibles</h3>
            <canvas id="mas_disponibles-grafica" class="bloque__grafico"></canvas>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>