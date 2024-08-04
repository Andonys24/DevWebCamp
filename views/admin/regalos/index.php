<h2 class="dashboard__heading"><?php echo $titulo; ?></h2>

<?php include_once __DIR__ . '/../../templates/alertas.php' ?>

<div class="dashboard__contenedor-boton">
    <a class="dashboard__boton" href="/admin/regalos/crear">
        <i class="fa-solid fa-circle-plus"></i>
        Agregar Regalos
    </a>
</div>

<div class="dashboard__contenedor">
    <?php if (!empty($regalos)) { ?>
        <table class="table">
            <thead class="table__thead">
                <tr>
                    <th scope="col" class="table__th">Nombre</th>
                    <th scope="col" class="table__th"></th>
                </tr>
            </thead>
            <tbody class="table__tbody">
                <?php foreach ($regalos as $regalo) : ?>
                    <tr class="table__tr">
                        <td class="table__td"><?php echo $regalo->nombre; ?></td>
                        <td class="table__td--acciones">
                            <a href="/admin/regalos/editar?id=<?php echo $regalo->id; ?>" class="table__accion table__accion--editar">
                                <i class="fa-solid fa-pencil"></i>
                                Editar
                            </a>
                            <form action="/admin/regalos/eliminar" method="POST" class="table__form">
                                <input type="hidden" name="id" value="<?php echo $regalo->id; ?>">
                                <button type="submit" class="table__accion table__accion--eliminar">
                                    <i class="fa-solid fa-trash"></i>
                                    Eliminar
                                </button>
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php } else { ?>
        <p class="text-center">No hay Regalos Aun</p>
    <?php } ?>
</div>

<?php

echo $paginacion;
