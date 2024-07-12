import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReturnScreen extends StatefulWidget {
  const ReturnScreen({super.key});

  @override
  _ReturnScreenState createState() => _ReturnScreenState();
}

class _ReturnScreenState extends State<ReturnScreen> {
  List<Map<String, dynamic>> rows = [
    {
      'name': 'Item 1',
      'productId': '1',
      'quantity': '10',
      'sellingPrice': '40.00', // Changed selling price to 40.00
      'originalQuantity': '10',
    },
    {
      'name': 'Item 2',
      'productId': '2',
      'quantity': '15',
      'sellingPrice': '40.00', // Changed selling price to 40.00
      'originalQuantity': '15',
    },
  ];
  String currentInvoiceId = '';
  String currentProductId = '';
  final TextEditingController invoiceIdController = TextEditingController();
  final TextEditingController productIdController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  void updateRow(String productId) {
    var row = rows.firstWhere((row) => row['productId'] == productId, orElse: () => {});
    if (row.isNotEmpty) {
      setState(() {
        productIdController.text = row['productId'].toString();
        quantityController.text = row['quantity'].toString();
      });
    }
  }

  void saveUpdatedRow() {
    var productId = productIdController.text;
    var row = rows.firstWhere((row) => row['productId'] == productId, orElse: () => {});

    if (row.isNotEmpty) {
      int updatedQuantity = int.tryParse(quantityController.text) ?? 0;
      int originalQuantity = int.tryParse(row['originalQuantity'].toString()) ?? 0;

      if (updatedQuantity > originalQuantity) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Quantity cannot be increased beyond the fetched amount')),
        );
        return;
      }

      setState(() {
        row['quantity'] = updatedQuantity.toString();
      });
    }

    productIdController.clear();
    quantityController.clear();
  }

  double calculateTotal() {
    double total = 0.0;
    for (var row in rows) {
      int quantity = int.tryParse(row['quantity'].toString()) ?? 0;
      double sellingPrice = double.tryParse(row['sellingPrice'].toString()) ?? 0.0;
      total += quantity * sellingPrice;
    }
    return total;
  }

  Future<void> fetchDataFromApi(String invoiceId) async {
    final response = await http.post(
      Uri.parse('https://your-python-api-endpoint.com/your-api-endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'invoiceId': invoiceId}),
    );

    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);
      setState(() {
        rows = responseData.map((row) {
          return {
            'name': row['name'].toString(),
            'productId': row['productId'].toString(),
            'quantity': row['quantity'].toString(),
            'sellingPrice': '40.00', // Changed selling price to 40.00
            'originalQuantity': row['quantity'].toString(),
          };
        }).toList();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: ${response.reasonPhrase}')),
      );
    }
  }

  @override
  void dispose() {
    invoiceIdController.dispose();
    productIdController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20), // Add some space
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Return Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20), // Add additional space if needed
            Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/backgrounds/bg_image1.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: invoiceIdController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Invoice ID to fetch data',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          fetchDataFromApi(invoiceIdController.text);
                        },
                        child: const Text('Fetch Data from API'),
                      ),
                    ),

                  const Divider(color: Color.fromARGB(120, 0, 0, 0),
                  thickness: 5,
                  ),

                
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Items',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: rows.length,
                      itemBuilder: (context, index) {
                        var row = rows[index];
                        return ListTile(
                          title: Text('Name: ${row['name']}'),
                          subtitle: Text(
                            'Product ID: ${row['productId']} - Quantity: ${row['quantity']} - Selling Price: \$${row['sellingPrice']}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              updateRow(row['productId']);
                              setState(() {
                                productIdController.text = row['productId'].toString();
                              });
                            },
                          ),
                        );
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: productIdController,
                        readOnly: true, // Read-only to show Product ID from row edit
                        decoration: const InputDecoration(
                          labelText: 'Product ID',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: quantityController,
                        decoration: const InputDecoration(
                          labelText: 'Update Quantity',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: saveUpdatedRow,
                        child: const Text('Save Updated Row'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Total Return: \$${calculateTotal().toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
