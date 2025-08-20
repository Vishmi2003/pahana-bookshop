<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Staff Dashboard - Pahana Edu Bookshop</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #FBE9E7;
      margin: 0;
      padding: 0;
      color: #4E342E;
    }
    header {
      background-color: #4E342E;
      color: #FFD54F;
      padding: 15px;
      text-align: center;
      position: relative;
    }
    .logo-title {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 15px;
    }
    #logo {
      width: 60px;
      height: auto;
    }
    h2 {
      color: #4E342E;
      border-bottom: 2px solid #FFD54F;
      padding-bottom: 5px;
    }
    .container {
      width: 90%;
      margin: auto;
      margin-top: 20px;
    }
    .section {
      background: white;
      padding: 20px;
      margin-bottom: 20px;
      border-radius: 8px;
      box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
    }
    label {
      font-weight: bold;
    }
    input, select, button {
      padding: 8px;
      margin: 5px 0;
      width: 100%;
      border-radius: 4px;
      border: 1px solid #ccc;
    }
    button {
      background-color: #FFD54F;
      color: #4E342E;
      border: none;
      font-weight: bold;
      cursor: pointer;
    }
    button:hover {
      background-color: #FFC107;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }
    table, th, td {
      border: 1px solid #ddd;
    }
    th {
      background-color: #4E342E;
      color: white;
      padding: 10px;
    }
    td {
      padding: 8px;
      text-align: center;
    }
    .total {
      font-size: 18px;
      font-weight: bold;
      margin-top: 10px;
    }
    .print-btn {
      background-color: #4CAF50;
      color: white;
    }
    .print-btn:hover {
      background-color: #388E3C;
    }
    .search-box {
      display: flex;
      gap: 8px;
      margin-bottom: 10px;
    }
    .search-box input {
      flex: 1;
    }
    .actions button {
      margin: 0 3px;
    }
    .back-btn {
      position: absolute;
      top: 15px;
      right: 20px;
      background-color: #FFD54F;
      color: #4E342E;
      padding: 8px 12px;
      border-radius: 5px;
      text-decoration: none;
      font-weight: bold;
    }
    .back-btn:hover { background-color: #FFC107; }
  </style>

  <script>
    let billItems = [];
    let manageItems = [];
    let dailyBills = [];
    let billCounter = 1; // auto-increment bill number

    // Billing functions
    function addItemToBill() {
      let itemName = document.getElementById("billItemName").value;
      let unitPrice = parseFloat(document.getElementById("billUnitPrice").value);
      let quantity = parseInt(document.getElementById("billQuantity").value);

      if (itemName && unitPrice > 0 && quantity > 0) {
        let total = unitPrice * quantity;
        billItems.push({itemName, unitPrice, quantity, total});
        displayBillItems();
      } else {
        alert("Please enter valid item details.");
      }
    }

    function displayBillItems() {
      let tableBody = document.getElementById("billTableBody");
      tableBody.innerHTML = "";
      let grandTotal = 0;

      billItems.forEach((item, index) => {
        grandTotal += item.total;
        tableBody.innerHTML += `
          <tr>
            <td>${item.itemName}</td>
            <td>${item.unitPrice.toFixed(2)}</td>
            <td>${item.quantity}</td>
            <td>${item.total.toFixed(2)}</td>
            <td><button onclick="removeBillItem(${index})">Remove</button></td>
          </tr>
        `;
      });

      document.getElementById("grandTotal").innerText = "Total: Rs. " + grandTotal.toFixed(2);
    }

    function removeBillItem(index) {
      billItems.splice(index, 1);
      displayBillItems();
    }

    function printBill() {
      if (billItems.length === 0) {
        alert("No items in the bill!");
        return;
      }

      let grandTotal = billItems.reduce((sum, item) => sum + item.total, 0);
      let billData = JSON.parse(JSON.stringify(billItems));

      // Generate new bill number
      let billNo = billCounter++;

      dailyBills.push({ billNo, date: new Date().toLocaleString(), items: billData, total: grandTotal });
      displayDailyBills();

      let printWindow = window.open('', '', 'width=800,height=600');
      printWindow.document.write("<h2>Pahana Edu Bookshop - Bill</h2>");
      printWindow.document.write("<p><b>Bill No:</b> " + billNo + "</p>");
      printWindow.document.write("<p><b>Date:</b> " + new Date().toLocaleString() + "</p>");
      printWindow.document.write("<table border='1' style='width:100%; border-collapse: collapse;'><tr><th>Item</th><th>Unit Price</th><th>Quantity</th><th>Total</th></tr>");
      billData.forEach(item => {
        printWindow.document.write(`<tr><td>${item.itemName}</td><td>${item.unitPrice.toFixed(2)}</td><td>${item.quantity}</td><td>${item.total.toFixed(2)}</td></tr>`);
      });
      printWindow.document.write("</table>");
      printWindow.document.write("<h3>Total: Rs. " + grandTotal.toFixed(2) + "</h3>");
      printWindow.print();

      billItems = [];
      displayBillItems();
      document.getElementById("billItemName").value = "";
      document.getElementById("billUnitPrice").value = "";
      document.getElementById("billQuantity").value = "";
    }

    // Manage Items functions
    function addItem() {
      const id = document.getElementById('itemId').value.trim();
      const name = document.getElementById('itemName').value.trim();
      const price = parseFloat(document.getElementById('itemPrice').value);
      const qty = parseInt(document.getElementById('itemQty').value);

      if (!id || !name || isNaN(price) || isNaN(qty)) {
        alert('Please fill all fields correctly.');
        return;
      }

      manageItems.push({ id, name, price, qty });
      renderTable();
      clearForm();
    }

    function clearForm() {
      document.getElementById('itemId').value = '';
      document.getElementById('itemName').value = '';
      document.getElementById('itemPrice').value = '';
      document.getElementById('itemQty').value = '';
    }

    function renderTable(filtered = manageItems) {
      const tbody = document.getElementById('itemsTableBody');
      tbody.innerHTML = '';
      filtered.forEach((item, index) => {
        tbody.innerHTML += `
          <tr>
            <td>${item.id}</td>
            <td>${item.name}</td>
            <td>${item.price.toFixed(2)}</td>
            <td>${item.qty}</td>
            <td class="actions">
              <button onclick="editItem(${index})">Edit</button>
              <button onclick="deleteItem(${index})">Delete</button>
            </td>
          </tr>
        `;
      });
    }

    function deleteItem(index) {
      if (confirm('Delete this item?')) {
        manageItems.splice(index, 1);
        renderTable();
      }
    }

    function editItem(index) {
      const item = manageItems[index];
      document.getElementById('itemId').value = item.id;
      document.getElementById('itemName').value = item.name;
      document.getElementById('itemPrice').value = item.price;
      document.getElementById('itemQty').value = item.qty;
      manageItems.splice(index, 1);
    }

    // Search
    function searchItem() {
      const query = document.getElementById('search').value.toLowerCase().trim();
      if (!query) {
        renderTable(); // show all
        return;
      }
      const filtered = manageItems.filter(item =>
              item.name.toLowerCase().includes(query) ||
              item.id.toString().includes(query)
      );
      renderTable(filtered);
    }

    // Daily bills display
    function displayDailyBills() {
      const tbody = document.getElementById('dailyBillsTableBody');
      tbody.innerHTML = '';
      dailyBills.forEach(bill => {
        tbody.innerHTML += `
          <tr>
            <td>${bill.billNo}</td>
            <td>${bill.date}</td>
            <td>${bill.items.map(i => i.itemName).join(", ")}</td>
            <td>Rs. ${bill.total.toFixed(2)}</td>
          </tr>
        `;
      });
    }
  </script>
</head>
<body>

<header>
  <div class="logo-title">
    <img src="https://cdn-icons-png.flaticon.com/512/29/29302.png" id="logo" alt="Bookshop Logo">
    <h1>Pahana Edu Bookshop</h1>
  </div>
  <a href="index.jsp" class="back-btn">⬅ Back to Home</a>
</header>

<div class="container">

  <!-- Manage Items Section -->
  <div class="section">
    <h2>Manage Items</h2>
    <label>Item ID:</label>
    <input type="text" id="itemId" placeholder="Enter Item ID">
    <label>Item Name:</label>
    <input type="text" id="itemName" placeholder="Enter Item Name">
    <label>Price (Rs.):</label>
    <input type="number" id="itemPrice" placeholder="Enter Price">
    <label>Author:</label>
    <input type="text" id="author" placeholder="Author">
    <label>Description:</label>
    <input type="text" id="discription" placeholder="Description">
    <label>Quantity:</label>
    <input type="number" id="itemQty" placeholder="Enter Quantity">
    <button onclick="addItem()">Add / Update Item</button>

    <table>
      <thead>
      <tr>
        <th>Item ID</th>
        <th>Name</th>
        <th>Price (Rs.)</th>
        <th>Qty</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody id="itemsTableBody"></tbody>
    </table>
  </div>

  <!-- Billing System Section -->
  <div class="section">
    <h2>Billing System</h2>
    <label>Item Name:</label>
    <input type="text" id="billItemName" placeholder="Enter item name">
    <label>Unit Price (Rs.):</label>
    <input type="number" id="billUnitPrice" placeholder="Enter unit price">
    <label>Quantity:</label>
    <input type="number" id="billQuantity" placeholder="Enter quantity">
    <button onclick="addItemToBill()">Add to Bill</button>

    <table>
      <thead>
      <tr>
        <th>Item</th>
        <th>Unit Price (Rs.)</th>
        <th>Quantity</th>
        <th>Total (Rs.)</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody id="billTableBody"></tbody>
    </table>
    <p class="total" id="grandTotal">Total: Rs. 0.00</p>
    <button class="print-btn" onclick="printBill()">Print Bill</button>
  </div>

  <!-- Daily Bill Details Section -->
  <div class="section">
    <h2>Daily Bill Details</h2>
    <table>
      <thead>
      <tr>
        <th>Bill No</th>
        <th>Date & Time</th>
        <th>Items</th>
        <th>Total (Rs.)</th>
      </tr>
      </thead>
      <tbody id="dailyBillsTableBody"></tbody>
    </table>
  </div>

</div>

</body>
</html>
