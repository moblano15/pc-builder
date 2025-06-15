#!/bin/bash

# Nombre de la carpeta del proyecto
DIR="pc-builder"

echo "📁 Creando carpeta del proyecto: $DIR"
mkdir -p "$DIR"
cd "$DIR"

echo "📄 Creando archivos..."

# index.html
cat << 'EOF' > index.html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>PC Builder</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <div class="app-container">
    <h1>PC Builder</h1>
    <form id="pc-form"></form>
    <table id="summary-table">
      <thead>
        <tr>
          <th>Componente</th>
          <th>Imagen</th>
          <th>Especificaciones</th>
          <th>Precio (€)</th>
        </tr>
      </thead>
      <tbody></tbody>
      <tfoot>
        <tr class="total-row">
          <td colspan="3">Total</td>
          <td id="total-price">0 €</td>
        </tr>
      </tfoot>
    </table>
  </div>
  <script src="data.js"></script>
  <script src="script.js"></script>
</body>
</html>
EOF

# style.css
cat << 'EOF' > style.css
body, html {
  margin: 0;
  padding: 0;
  font-family: monospace;
  background: linear-gradient(135deg, #000000, #004400);
  color: #00ff00;
  min-height: 100vh;
}
img {
  max-width: 60px;
  border-radius: 5px;
}
.app-container {
  max-width: 900px;
  margin: auto;
  padding: 20px;
}
h1 {
  text-align: center;
}
form {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  justify-content: center;
  margin-bottom: 20px;
}
form label {
  display: flex;
  flex-direction: column;
  font-weight: bold;
}
form select {
  background-color: black;
  color: #00ff00;
  border: 1px solid #00ff00;
  padding: 6px;
}
table {
  width: 100%;
  border-collapse: collapse;
}
th, td {
  border: 1px solid #00ff00;
  padding: 8px;
}
.total-row {
  font-weight: bold;
  background-color: #004400;
}
EOF

# script.js
cat << 'EOF' > script.js
const form = document.getElementById("pc-form");
const tableBody = document.querySelector("#summary-table tbody");
const totalPriceElem = document.getElementById("total-price");

const selected = {};

function renderForm() {
  for (const category in data) {
    const label = document.createElement("label");
    label.innerHTML = \`\${category.toUpperCase()}<select id="\${category}"><option value="">-- Seleccionar --</option></select>\`;

    const select = label.querySelector("select");

    data[category].forEach((item) => {
      const option = document.createElement("option");
      option.value = item.name;
      option.textContent = item.name;
      select.appendChild(option);
    });

    select.addEventListener("change", () => {
      selected[category] = select.value;
      renderTable();
    });

    form.appendChild(label);
  }
}

function renderTable() {
  tableBody.innerHTML = "";
  let total = 0;

  for (const category in selected) {
    const name = selected[category];
    const item = data[category].find((i) => i.name === name);
    if (!item) continue;

    const row = document.createElement("tr");
    row.innerHTML = \`
      <td>\${item.name}</td>
      <td><img src="\${item.image}" alt="\${item.name}"></td>
      <td>\${item.specs}</td>
      <td>\${item.price} €</td>
    \`;
    total += item.price;
    tableBody.appendChild(row);
  }

  totalPriceElem.textContent = \`\${total} €\`;
}

renderForm();
EOF

# data.js
cat << 'EOF' > data.js
const data = {
  cpu: [
    {
      name: "Intel i5-10400F",
      socket: "LGA1200",
      tdpMin: 45,
      tdpMax: 65,
      image: "https://thumb.pccomponentes.com/w-530-530/articles/28/287898/intel-core-i5-10400f-290-ghz.jpg",
      specs: "6 núcleos, 12 hilos, 2.9GHz base, TDP 45-65W",
      price: 363
    }
  ],
  motherboard: [],
  ram: [],
  heatsink: [],
  gpu: [],
  storage: [],
  psu: [],
  case: []
};
EOF

# contenido.html
cat << 'EOF' > contenido.html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Acerca de la App PC Builder</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f9f9f9;
      margin: 0;
      padding: 2rem;
      color: #333;
    }
    .container {
      max-width: 800px;
      margin: auto;
      background: white;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }
    h1, h2 {
      color: #006400;
    }
    ul {
      padding-left: 1.5rem;
    }
    code {
      background: #eee;
      padding: 0.2rem 0.4rem;
      border-radius: 4px;
      font-size: 0.95rem;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Acerca de la Aplicación PC Builder</h1>
    <p>Esta aplicación permite seleccionar componentes de PC y calcular el precio total. Fue desarrollada en HTML, CSS y JavaScript puro, sin frameworks.</p>

    <h2>🚀 Cómo usar</h2>
    <ol>
      <li>Descarga o clona el proyecto.</li>
      <li>Ejecuta el script <code>instalar_pc_builder.sh</code> si estás en Linux.</li>
      <li>La aplicación se abrirá automáticamente en tu navegador en <code>http://localhost:8000</code>.</li>
    </ol>

    <h2>📦 Tecnologías utilizadas</h2>
    <ul>
      <li>HTML5</li>
      <li>CSS3</li>
      <li>JavaScript Vanilla</li>
      <li>Python (para servidor local opcional)</li>
    </ul>

    <h2>📁 Archivos incluidos</h2>
    <ul>
      <li><code>index.html</code>: interfaz principal</li>
      <li><code>style.css</code>: estilos</li>
      <li><code>script.js</code>: lógica JS</li>
      <li><code>data.js</code>: datos de componentes</li>
    </ul>

    <p>Desarrollado por [Tu Nombre] — <em>Ubuntu 24.04 ready</em>.</p>
  </div>
</body>
</html>
EOF

echo "🚀 Lanzando servidor local en http://localhost:8000"
python3 -m http.server 8000
