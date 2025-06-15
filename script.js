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
