import React, { useState } from "react";
import { data } from "./data";
import "./App.css";

const categories = [
  "cpu",
  "motherboard",
  "ram",
  "heatsink",
  "gpu",
  "storage",
  "psu",
  "case",
];

function App() {
  // Estado para seleccionados, inicializa con el primero de cada categoría
  const [selected, setSelected] = useState(
    categories.reduce((acc, cat) => {
      acc[cat] = data[cat][0];
      return acc;
    }, {})
  );

  // Manejar cambio en selects
  const handleChange = (category, e) => {
    const product = data[category].find((p) => p.name === e.target.value);
    setSelected((prev) => ({ ...prev, [category]: product }));
  };

  // Calcular total precio
  const totalPrice = categories.reduce(
    (acc, cat) => acc + (selected[cat]?.price || 0),
    0
  );

  return (
    <div className="app-container">
      <h1>Configurador PC - Estilo Matrix</h1>
      <form>
        {categories.map((cat) => (
          <label key={cat}>
            {cat.toUpperCase()}:
            <select
              value={selected[cat]?.name}
              onChange={(e) => handleChange(cat, e)}
            >
              {data[cat].map((product) => (
                <option key={product.name} value={product.name}>
                  {product.name} - €{product.price}
                </option>
              ))}
            </select>
          </label>
        ))}
      </form>

      <table>
        <thead>
          <tr>
            <th>Categoría</th>
            <th>Producto</th>
            <th>Imagen</th>
            <th>Precio (€)</th>
          </tr>
        </thead>
        <tbody>
          {categories.map((cat) => {
            const product = selected[cat];
            return (
              <tr key={cat}>
                <td>{cat.toUpperCase()}</td>
                <td>{product.name}</td>
                <td>
                  <img src={product.image} alt={product.name} />
                </td>
                <td>{product.price.toFixed(2)}</td>
              </tr>
            );
          })}
          <tr className="total-row">
            <td colSpan="3">TOTAL</td>
            <td>€{totalPrice.toFixed(2)}</td>
          </tr>
        </tbody>
      </table>
    </div>
  );
}

export default App;
