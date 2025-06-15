// === MATRIX BACKGROUND EFFECT ===
const canvas = document.getElementById("matrixCanvas");
const ctx = canvas.getContext("2d");

let width = canvas.width = window.innerWidth;
let height = canvas.height = window.innerHeight;

const letters = "アァカサタナハマヤャラワガザダバパイィキシチニヒミリヰギジヂビピウゥクスツヌフムユュルグズヅブプエェケセテネヘメレヱゲゼデベペオォコソトノホモヨョロヲゴゾドボポヴABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
const fontSize = 16;
const columns = Math.floor(width / fontSize);
const drops = Array(columns).fill(1);

function draw() {
  ctx.fillStyle = "rgba(0, 0, 0, 0.05)";
  ctx.fillRect(0, 0, width, height);

  ctx.fillStyle = "#0F0"; // green
  ctx.font = fontSize + "px monospace";

  for (let i = 0; i < drops.length; i++) {
    const text = letters.charAt(Math.floor(Math.random() * letters.length));
    const x = i * fontSize;
    const y = drops[i] * fontSize;

    ctx.fillText(text, x, y);

    if (y > height && Math.random() > 0.975) {
      drops[i] = 0;
    }

    drops[i]++;
  }
}

setInterval(draw, 35);

window.addEventListener("resize", () => {
  width = canvas.width = window.innerWidth;
  height = canvas.height = window.innerHeight;
});

// === DINÁMICO: FORMULARIO + TABLA ===
const form = document.getElementById("componentForm");
const tbody = document.querySelector("#productTable tbody");
const totalPriceEl = document.getElementById("totalPrice");

// Guarda selección actual
const selectedProducts = {};

// Crear selects dinámicamente
function crearSelects() {
  for (const category in data) {
    const label = document.createElement("label");
    label.textContent = category.toUpperCase();

    const select = document.createElement("select");
    select.name = category;

    // Opciones
    data[category].forEach((product, index) => {
      const option = document.createElement("option");
      option.value = index;
      option.textContent = product.name + ` (€${product.price.toFixed(2)})`;
      select.appendChild(option);
    });

    // Inicializamos selección con la primera opción
    selectedProducts[category] = data[category][0];

    select.addEventListener("change", (e) => {
      const idx = parseInt(e.target.value, 10);
      selectedProducts[category] = data[category][idx];
      actualizarTabla();
    });

    label.appendChild(select);
    form.appendChild(label);
  }
}

// Actualizar la tabla con selección actual
function actualizarTabla() {
  tbody.innerHTML = "";
  let total = 0;

  for (const [category, product] of Object.entries(selectedProducts)) {
    total += product.price;

    const tr = document.createElement("tr");

    // Imagen
    const imgTd = document.createElement("td");
    imgTd.classList.add("image-cell");
    const img = document.createElement("img");
    img.src = product.image;
    img.alt = product.name;
    imgTd.appendChild(img);
    tr.appendChild(imgTd);

    // Categoría
    const catTd = document.createElement("td");
    catTd.textContent = category.toUpperCase();
    tr.appendChild(catTd);

    // Nombre producto
    const nameTd = document.createElement("td");
    nameTd.textContent = product.name;
    tr.appendChild(nameTd);

    // Specs
    const specsTd = document.createElement("td");
    specsTd.textContent = product.specs;
    tr.appendChild(specsTd);

    // Precio
    const priceTd = document.createElement("td");
    priceTd.textContent = `€${product.price.toFixed(2)}`;
    tr.appendChild(priceTd);

    tbody.appendChild(tr);
  }

  totalPriceEl.textContent = `€${total.toFixed(2)}`;
}

// Inicializamos selects y tabla
crearSelects();
actualizarTabla();
