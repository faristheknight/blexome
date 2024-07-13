import 'package:flutter/material.dart';
import 'package:pos/CommonWidgets/heading.dart';
import 'package:pos/labels.dart';
import 'package:pos/screens/ScannerScreens/components/PageComponents/row_function.dart';
// import 'package:pos/CommonWidgets/profit_and_sales_widget.dart';
import 'package:pos/screens/ScannerScreens/components/Scanner/scanner.dart';

class Purchase extends StatefulWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  List<Map<String, String>> rows = [];
  String currentName = '';
  String currentId = '';
  String currentQuantity = '';
  String currentCost = ''; // Added for cost
  String currentSellingPrice = '';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController costController = TextEditingController(); // Controller for cost
  final TextEditingController sellingPriceController = TextEditingController();

  void addRow(String name, String id, String quantity, String cost, String sellingPrice) {
    if (id.isEmpty) {
      // Show an error message if the ID is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ID cannot be empty')),
      );
      return;
    }

    // Validate numeric fields
    if (!isNumeric(id)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ID must be a numeric value')),
      );
      return;
    }
    if (!isNumeric(quantity) && quantity.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quantity must be a numeric value')),
      );
      return;
    }
    if (!isNumeric(cost) && cost.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cost must be a numeric value')),
      );
      return;
    }
    if (!isNumeric(sellingPrice) && sellingPrice.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selling Price must be a numeric value')),
      );
      return;
    }

    setState(() {
      var existingRow = rows.firstWhere((row) => row['id'] == id, orElse: () => {});
      if (existingRow.isNotEmpty) {
        // Increment the quantity of the existing row
        int incrementQuantity = quantity.isEmpty ? 1 : int.parse(quantity);
        int newQuantity = int.parse(existingRow['quantity']!) + incrementQuantity;
        existingRow['quantity'] = newQuantity.toString();
        existingRow['sellingPrice'] = sellingPrice.isEmpty ? existingRow['sellingPrice']! : sellingPrice;
        existingRow['cost'] = cost.isEmpty ? existingRow['cost']! : cost;
      } else {
        // Add a new row with quantity default to 1 if empty
        rows.add({
          'Name': name,
          'id': id,
          'quantity': quantity.isEmpty ? '1' : quantity,
          'cost': cost.isEmpty ? '0' : cost,
          'sellingPrice': sellingPrice.isEmpty ? '0' : sellingPrice,
        });
      }
    });

    // Clear the input fields and current variables after adding a row
    nameController.clear();
    idController.clear();
    quantityController.clear();
    costController.clear(); // Clear cost controller
    sellingPriceController.clear();
    currentName = '';
    currentId = '';
    currentQuantity = '';
    currentCost = '';
    currentSellingPrice = '';
  }

  void updateRow(String id) {
    var row = rows.firstWhere((row) => row['id'] == id, orElse: () => {});
    if (row.isNotEmpty) {
      setState(() {
        nameController.text = row['Name']!;
        idController.text = row['id']!;
        quantityController.text = row['quantity']!;
        costController.text = row['cost']!; // Set cost controller text
        sellingPriceController.text = row['sellingPrice']!;
        rows.removeWhere((row) => row['id'] == id);
        currentName = row['Name']!;
        currentId = row['id']!;
        currentQuantity = row['quantity']!;
        currentCost = row['cost']!;
        currentSellingPrice = row['sellingPrice']!;
      });
    }
  }

  void deleteRow(String id) {
    setState(() {
      rows.removeWhere((row) => row['id'] == id);
    });
  }

  void gatherRows() {
    // This function gathers all rows data and prints it to the console
    // You can replace this with your API call to pass the data to your Python Flask API
    print(rows);
  }

  double calculateTotal() {
    double total = 0.0;
    for (var row in rows) {
      int quantity = int.parse(row['quantity']!);
      double sellingPrice = double.parse(row['sellingPrice']!);
      total += quantity * sellingPrice;
    }
    return total;
  }

  bool isNumeric(String str) {
    if (str.isEmpty) return false;
    return double.tryParse(str) != null;
  }

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    quantityController.dispose();
    costController.dispose(); // Dispose cost controller
    sellingPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/backgrounds/bg_image1.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Heading(
                  
                    text: Labels.purchase(),
                    fontSize: 32.4,
                    fontWeight: FontWeight.bold,
                    textColor: const Color(0xFF49688D),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: const Scanner(),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        onChanged: (value) => currentName = value,
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      TextField(
                        controller: idController,
                        onChanged: (value) => currentId = value,
                        decoration: const InputDecoration(labelText: 'ID'),
                      ),
                      TextField(
                        controller: quantityController,
                        onChanged: (value) => currentQuantity = value,
                        decoration: const InputDecoration(labelText: 'Quantity'),
                      ),
                      TextField(
                        controller: costController,
                        onChanged: (value) => currentCost = value,
                        decoration: const InputDecoration(labelText: 'Cost'),
                      ),
                      TextField(
                        controller: sellingPriceController,
                        onChanged: (value) => currentSellingPrice = value,
                        decoration: const InputDecoration(labelText: 'Selling Price'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addRow(currentName, currentId, quantityController.text, costController.text, currentSellingPrice);
                        },
                        child: const Text('Add Row'),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Expanded(child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(child: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(child: Text('Selling Price', style: TextStyle(fontWeight: FontWeight.bold))),
                          Icon(Icons.update, color: Colors.transparent), // Placeholder for alignment
                          Icon(Icons.delete, color: Colors.transparent), // Placeholder for alignment
                        ],
                      ),
                      const Divider(),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: rows
                            .map(
                              (row) => TableRowWidget(
                                name: row['Name']!,
                                id: row['id']!,
                                quantity: row['quantity']!,
                                sellingPrice: row['sellingPrice']!,
                                onUpdate: updateRow,
                                onDelete: deleteRow,
                              ),
                            )
                            .toList(),
                      ),
                      if (rows.isNotEmpty)
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: gatherRows,
                              child: const Text('Sell'),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Total: PKR ${calculateTotal().toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
