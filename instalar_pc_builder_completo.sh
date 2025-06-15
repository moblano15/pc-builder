#!/bin/bash

# Nombre de la carpeta del proyecto
DIR="pc-builder"

echo "📁 Creando carpeta del proyecto: $DIR"
mkdir -p "$DIR"
cd "$DIR" || exit

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
    label.innerHTML = `${category.toUpperCase()}<select id="${category}"><option value="">-- Seleccionar --</option></select>`;

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
    row.innerHTML = `
      <td>${item.name}</td>
      <td><img src="${item.image}" alt="${item.name}"></td>
      <td>${item.specs}</td>
      <td>${item.price} €</td>
    `;
    total += item.price;
    tableBody.appendChild(row);
  }

  totalPriceElem.textContent = `${total} €`;
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
    },
    {
      name: "Ryzen 5 5600G",
      socket: "AM4",
      tdpMin: 45,
      tdpMax: 65,
      image: "https://thumb.pccomponentes.com/w-530-530/articles/42/422971/1183-amd-ryzen-5-5600g-440ghz.jpg",
      specs: "6 núcleos, 12 hilos, 3.9GHz base, TDP 65W",
      price: 180
    }
  ],
  motherboard: [
    {
      name: "MSI B550M PRO-VDH WIFI",
      socket: "AM4",
      ramType: "DDR4",
      formFactor: "mATX",
      image: "https://thumb.pccomponentes.com/w-530-530/articles/30/302210/1662-msi-b550m-pro-vdh-wifi.jpg",
      specs: "Socket AM4, DDR4, mATX",
      price: 120
    },
    {
      name: "ASUS TUF B650-E WIFI",
      socket: "AM5",
      ramType: "DDR5",
      formFactor: "ATX",
      image: "https://thumb.pccomponentes.com/w-530-530/articles/1083/10832486/1272-asus-tuf-gaming-b650-e-wifi.jpg",
      specs: "Socket AM5, DDR5, ATX",
      price: 170
    }
  ],
  ram: [
    {
      name: "Corsair Vengeance RGB Pro 2x16GB",
      type: "DDR4",
      image: "https://img.pccomponentes.com/articles/35/351295/1838-corsair-vengeance-rgb-pro-ddr4-3200-pc4-25600-32gb-2x16gb-cl16.jpg",
      specs: "DDR4 3200MHz, 32GB (2x16GB)",
      price: 68
    },
    {
      name: "Corsair 32GB DDR5 5200MHz",
      type: "DDR5",
      image: "https://thumb.pccomponentes.com/w-530-530/articles/1088/10888834/4808-memoria-ram-corsair-32gb-ddr5-5200mhz-1x32gb-unbuffered-heatsink-especificaciones.jpg",
      specs: "DDR5 5200MHz, 32GB (1x32GB)",
      price: 90
    }
  ],
  heatsink: [
    {
      name: "DeepCool AK620 Zero Dark",
      compatibleSockets: ["LGA1200", "LGA1700", "AM4", "AM5"],
      image: "https://thumb.pccomponentes.com/w-530-530/articles/1068/10680571/10580-deepcool-ak620-zero-dark-ventilador-cpu-120mm-negro-c362b62a-53e8-458a-8558-3eb9cd52ba67.jpg",
      specs: "Refrigeración por aire, TDP hasta 260W",
      price: 78
    },
    {
      name: "Tempest Liquid Cooler 240 RGB",
      compatibleSockets: ["LGA1200", "LGA1700", "AM4", "AM5"],
      image: "https://thumb.pccomponentes.com/w-530-530/articles/47/477338/4933-tempest-gaming-liquid-cooler-240-rgb-kit-de-refrigeracion-liquida-especificaciones.jpg",
      specs: "Refrigeración líquida 240mm, compatible AM4, AM5, LGA1200, LGA1700",
      price: 55
    }
  ],
  gpu: [
    {
      name: "NVIDIA RTX 3060 MSI VENTUS 2X OC LHR",
      powerConsumption: 550,
      image: "https://thumb.pccomponentes.com/w-530-530/articles/35/357848/1157-msi-geforce-rtx-3060-ventus-2x-oc-12gb-gddr6.jpg",
      specs: "12GB GDDR6, consumo 550W",
      price: 312
    },
    {
      name: "NVIDIA RTX 4060",
      powerConsumption: 550,
      image: "https://thumb.pccomponentes.com/w-530-530/articles/1077/10773759/1378-msi-geforce-rtx-4060-ti-ventus-2x-black-oc-16gb-gddr6-dlss3-opiniones.jpg",
      specs: "16GB GDDR6, DLSS3, consumo 550W",
      price: 613
    }
  ],
  storage: [
    {
      name: "Samsung SSD 1TB 870 QVO SATA3",
      image: "https://thumb.pccomponentes.com/w-530-530/articles/32/322021/6679-samsung-870-qvo-ssd-1tb-sata3-opiniones.jpg",
      specs: "1TB SATA III SSD",
      price: 83
    },
    {
      name: "Crucial SSD 1TB BX500 SATA3",
      image: "https://thumb.pccomponentes.com/w-530-530/articles/30/307638/1761-crucial-bx500-ssd-1tb-3d-nand-sata3.jpg",
      specs: "1TB SATA III SSD, 540MB/s",
      price: 59
    }
  ],
  psu: [
    {
      name: "MSI MAG a700BN",
      wattage: 700,
      efficiencyRating: "80 Plus Bronze",
      image: "https://thumb.pccomponentes.com/w-530-530/articles/66/661993/9688-msi-mag-a650bn-650w-80-plus-bronze-926cda66-b273-405f-ba7f-edce45dfe814.jpg",
      specs: "650W, 80+ Bronze",
      price: 50
    },
    {
      name: "Aerocool Mirage Gold RGB",
      wattage: 750,
      efficiencyRating: "80 Plus Gold",
      image: "https://thumb.pccomponentes.com/w-530-530/articles/1036/10366722/5595-aerocool-mirage-gold-rgb-650w-80-plus-gold-caracteristicas.jpg",
      specs: "650W, 80+ Gold",
      price: 77
    }
  ],
  case: [
    {
      name: "NZXT H510",
      supportedFormFactors: ["ATX", "mATX"],
      image: "https://m.media-amazon.com/images/I/81oF9hOXIEL._AC_SX679_.jpg",
      specs: "Compatible con placas ATX y mATX",
      price: 80
    },
    {
      name: "MSI MAG Forge M100R Cristal Templado",
      supportedFormFactors: ["ATX", "mATX"],
      image: "https://thumb.pccomponentes.com/w-530-530/articles/1040/10405218/1401-msi-mag-forge-m100r-cristal-templado-usb-32-argb-negra.jpg",
      specs: "Compatible con placas ATX y mATX",
      price: 43
    }
  ]
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
