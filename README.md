<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>PC Components - Matrix Style Selector</title>
  <link rel="stylesheet" href="styles.css" />
</head>
<body>
  <canvas id="matrixCanvas"></canvas>

  <div class="content">
    <h1>🖥️ Selecciona tus componentes</h1>

    <form id="componentForm">
      <!-- Aquí se generarán los selects -->
    </form>

    <h2>🛒 Productos seleccionados</h2>
    <table id="productTable">
      <thead>
        <tr>
          <th>Imagen</th>
          <th>Categoría</th>
          <th>Producto</th>
          <th>Especificaciones</th>
          <th>Precio</th>
        </tr>
      </thead>
      <tbody></tbody>
      <tfoot>
        <tr>
          <td colspan="4" style="text-align:right; font-weight:bold;">TOTAL:</td>
          <td id="totalPrice"></td>
        </tr>
      </tfoot>
    </table>
  </div>

  <script src="data.js"></script>
  <script src="matrix.js"></script>
</body>
</html>
