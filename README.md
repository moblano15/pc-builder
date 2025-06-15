PASOS PARA CREAR UNA APLICACIÓN WEB EN UBUNTU 24.04
🧱 1. Preparar entorno (no necesitas servidor si es HTML/CSS/JS puro)
Abre tu terminal (Ctrl + Alt + T).

📁 2. Crear carpeta del proyecto
bash
Copiar
Editar
mkdir pc-builder
cd pc-builder
📂 3. Crear los archivos básicos
Puedes crear y editar con nano, gedit, o code (si tienes VS Code). Por ejemplo:

bash
Copiar
Editar
nano index.html
Pega ahí el contenido de index.html que generamos. Haz lo mismo para:

style.css

script.js

data.js

🧪 4. Ver la app en el navegador
Simplemente abre el archivo index.html:

bash
Copiar
Editar
xdg-open index.html
O ve al explorador de archivos, busca el .html y haz doble clic. Se abrirá en Firefox o tu navegador predeterminado.

✅ OPCIONAL: Servidor local con Python
Si prefieres ver tu web como si estuviera servida por un servidor (por ejemplo, para evitar problemas con rutas o fetch), puedes hacerlo así:

Con Python 3 (ya viene instalado en Ubuntu):
bash
Copiar
Editar
python3 -m http.server 8000
Y luego entra a:

arduino
Copiar
Editar
http://localhost:8000
🛠️ Herramientas útiles en Ubuntu
gedit → editor de texto con interfaz gráfica.

nano → editor de texto en terminal.

code → si tienes Visual Studio Code instalado.

live-server (opcional, para desarrollo en caliente):

bash
Copiar
Editar
npm install -g live-server
live-server
🧼 Requisitos: Ninguno especial
No necesitas instalar frameworks, servidores ni dependencias para correr esta app, ya que es puro HTML/CSS/JavaScript.

¿Quieres que te escriba un script .sh que lo automatice todo?

Perfecto. A continuación te muestro un script Bash (instalar_pc_builder.sh) que:

Crea una carpeta pc-builder

Copia los archivos index.html, style.css, script.js, data.js dentro

Lanza un servidor local en http://localhost:8000 con Python

🖥️ Script: instalar_pc_builder.sh
bash
Copiar
Editar
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

# style.css (pegamos aquí tu CSS simplificado por espacio)
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

# data.js (contenido recortado por simplicidad, puedes reemplazarlo con el completo)
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

# Lanzar servidor local
echo "🚀 Lanzando servidor local en http://localhost:8000"
python3 -m http.server 8000
▶️ Cómo usarlo
Guarda el script como instalar_pc_builder.sh:

bash
Copiar
Editar
nano instalar_pc_builder.sh
Pega el contenido completo.

Hazlo ejecutable:

bash
Copiar
Editar
chmod +x instalar_pc_builder.sh
Ejecuta el script:

bash
Copiar
Editar
./instalar_pc_builder.sh
Tu app se abrirá en: http://localhost:8000


Aquí tienes tu script listo para descargar:

👉 Descargar instalar_pc_builder.sh

✅ ¿Cómo usarlo?
Descarga el archivo.

Abre una terminal en la carpeta donde lo guardaste.

Hazlo ejecutable:

bash
Copiar
Editar
chmod +x instalar_pc_builder.sh
Ejecuta el script:

bash
Copiar
Editar
./instalar_pc_builder.sh
