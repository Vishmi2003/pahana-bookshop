<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Billing System - Pahana Edu Bookshop</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #FBE9E7;
            color: #4E342E;
            padding: 30px;
        }
        h2 {
            color: #6D4C41;
            text-align: center;
            margin-bottom: 20px;
        }
        .section {
            background: rgba(255,255,255,0.85);
            padding: 25px;
            border-radius: 12px;
            max-width: 700px;
            margin: 0 auto 30px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #6D4C41;
        }
        button {
            margin-top: 15px;
            padding: 10px 20px;
            background: #4E342E;
            color: #FFD54F;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
        }
        button:hover { background: #6D4C41; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #6D4C41;
            text-align: center;
        }
        th {
            background: #6D4C41;
            color: #FFD54F;
        }
        .total {
            margin-top: 15px;
            text-align: right;
            font-size: 1.1rem;
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- Billing Input Section -->
<div class="section">
    <h2>Billing System</h2>
    <label>Item Name:</label>
    <input type="text" id="billItemName" placeholder="Enter item name">

    <label>Unit Price (Rs.):</label>
    <input type="number" id="billUnitPrice" placeholder="Enter unit price">

    <label>Quantity:</label>
    <input type="number" id="billQuantity" placeholder="Enter quantity">

    <button onclick="addItemToBill()">Add to Bill</button>
    <button onclick="printCurrentBill()">Print Bill</button>

    <table id="billTable">
        <thead>
        <tr>
            <th>#</th>
            <th>Item Name</th>
            <th>Unit Price (Rs.)</th>
            <th>Quantity</th>
            <th>Total (Rs.)</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
    <div class="total">Grand Total: Rs. <span id="grandTotal">0</span></div>
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

<script>
    let billCounter = 0;
    let grandTotal = 0;
    let dailyBillCounter = 0;
    let dailyBills = [];

    function addItemToBill() {
        const name = document.getElementById('billItemName').value.trim();
        const price = parseFloat(document.getElementById('billUnitPrice').value);
        const qty = parseInt(document.getElementById('billQuantity').value);

        if (!name || isNaN(price) || isNaN(qty) || price <= 0 || qty <= 0) {
            alert('Please enter valid item details.');
            return;
        }

        billCounter++;
        const total = price * qty;
        grandTotal += total;

        const tbody = document.getElementById('billTable').querySelector('tbody');
        const row = document.createElement('tr');
        row.innerHTML = `
        <td>${billCounter}</td>
        <td>${name}</td>
        <td>${price.toFixed(2)}</td>
        <td>${qty}</td>
        <td>${total.toFixed(2)}</td>
        <td><button onclick="removeItem(this, ${total})">Remove</button></td>
    `;
        tbody.appendChild(row);

        document.getElementById('grandTotal').innerText = grandTotal.toFixed(2);

        // Clear inputs
        document.getElementById('billItemName').value = '';
        document.getElementById('billUnitPrice').value = '';
        document.getElementById('billQuantity').value = '';
    }

    function removeItem(btn, itemTotal) {
        btn.parentElement.parentElement.remove();
        grandTotal -= itemTotal;
        document.getElementById('grandTotal').innerText = grandTotal.toFixed(2);
    }

    // Format datetime in MySQL-compatible format
    function getMySQLDateTime() {
        const now = ngetMySQLDateTime();
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const day = String(now.getDate()).padStart(2, '0');
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        const seconds = String(now.getSeconds()).padStart(2, '0');
        return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    }


    // Print current bill and save to daily bills
    function printCurrentBill() {
        const billRows = document.querySelectorAll('#billTable tbody tr');
        if (billRows.length === 0) {
            alert('No items in bill!');
            return;
        }

        let billContent = `Pahana Edu Bookshop\n\nItems:\n`;
        billRows.forEach(row => {
            const cols = row.children;
            billContent += `${cols[1].innerText} - ${cols[3].innerText} pcs @ Rs.${cols[2].innerText} = Rs.${cols[4].innerText}\n`;
        });
        billContent += `\nGrand Total: Rs.${grandTotal.toFixed(2)}`;

        // Save to daily bills table
        dailyBillCounter++;
        const now = new Date().toLocaleString();
        dailyBills.push({
            billNo: dailyBillCounter,
            datetime: now,
            items: billContent.replace(/\n/g, "<br>"),
            total: grandTotal.toFixed(2)
        });
        updateDailyBillsTable();

        // Print
        const printWindow = window.open('', '', 'height=600,width=800');
        printWindow.document.write('<pre>' + billContent + '</pre>');
        printWindow.print();
        printWindow.close();

        // Clear current bill
        document.querySelector('#billTable tbody').innerHTML = '';
        grandTotal = 0;
        billCounter = 0;
        document.getElementById('grandTotal').innerText = '0';
    }

    function updateDailyBillsTable() {
        const tbody = document.getElementById('dailyBillsTableBody');
        tbody.innerHTML = '';
        dailyBills.forEach(bill => {
            const row = document.createElement('tr');
            row.innerHTML = `
            <td>${bill.billNo}</td>
            <td>${bill.datetime}</td>
            <td><pre style="text-align:left;">${bill.items}</pre></td>
            <td>${bill.total}</td>
        `;
            tbody.appendChild(row);
        });
    }
</script>
<div style="text-align:center; margin-top:15px;">
    <button onclick="saveDailyBills()">Save Daily Bills to DB</button>
</div>

<script>
    function saveDailyBills() {
        if(dailyBills.length === 0){
            alert('No bills to save!');
            return;
        }

        // Convert dailyBills to JSON format expected by servlet
        const billsData = dailyBills.map(bill => {
            const items = bill.items.split('<br>').map(line => {
                const parts = line.split(' - ');
                if(parts.length < 2) return null;
                const name = parts[0];
                const [qtyPart, pricePart] = parts[1].split(' pcs @ Rs.');
                const quantity = parseInt(qtyPart);
                const unitPrice = parseFloat(pricePart);
                const total = quantity * unitPrice;
                return { name, quantity, unitPrice, total };
            }).filter(item => item !== null);
            return { datetime: bill.datetime, total: parseFloat(bill.total), items };
        });

        // Send AJAX POST request
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "SaveDailyBillsServlet", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onload = function() {
            alert(xhr.responseText);
        };
        xhr.send("bills=" + encodeURIComponent(JSON.stringify(billsData)));
    }

</script>


</body>
</html>
