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

index

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
