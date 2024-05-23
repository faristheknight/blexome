import 'package:flutter/material.dart';
import 'package:pos/constants.dart';
import 'package:pos/labels.dart';
import 'package:pos/Screens/Products/scanner_textfields_widget.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  String name = '';
  int quantity = 0;
  int price = 0;
  int scannerNumber = 0;

  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgrounds/bg_image1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Products",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: products
                          .map(
                            (product) => ProductBlock(
                              product: product,
                              onDelete: () {
                                setState(() {
                                  products.remove(product);
                                });
                              },
                              onUpdate: (newProduct) {
                                setState(() {
                                  int index =
                                      products.indexWhere((p) => p == product);
                                  products[index] = newProduct;
                                });
                              },
                              onEdit: () {
                                _showEditProductDialog(product);
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: FloatingActionButton(
                  backgroundColor: kBorderColor1,
                  onPressed: () {
                    _showAddProductDialog();
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, // Adjust the font size as needed
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddProductDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    TextEditingController scannerNumberController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
            data: ThemeData(
              textTheme:
                  const TextTheme(bodySmall: TextStyle(color: Colors.black)),
              inputDecorationTheme: const InputDecorationTheme(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kBorderColor1),
                ),
                hintStyle: TextStyle(color: kBorderColor1),
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                ),
                child: AlertDialog(
                  title: const Text("Add Product"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                        cursorColor: kBorderColor1,
                      ),
                      TextField(
                        controller: quantityController,
                        decoration:
                            const InputDecoration(labelText: 'Quantity'),
                        keyboardType: TextInputType.number,
                        cursorColor: kBorderColor1,
                      ),
                      TextField(
                        controller: scannerNumberController,
                        decoration:
                            const InputDecoration(labelText: 'Scanner Number'),
                        keyboardType: TextInputType.number,
                        cursorColor: kBorderColor1,
                      ),
                      TextField(
                        controller: priceController,
                        decoration: const InputDecoration(labelText: 'Price'),
                        keyboardType: TextInputType.number,
                        cursorColor: kBorderColor1,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        String name = nameController.text;
                        int quantity =
                            int.tryParse(quantityController.text) ?? 0;
                        int scannerNumber =
                            int.tryParse(quantityController.text) ?? 0;
                        double price =
                            double.tryParse(priceController.text) ?? 0.0;

                        if (name.isNotEmpty && quantity > 0 && price > 0) {
                          Product newProduct = Product(
                            name: name,
                            quantity: quantity,
                            scannerNumber: scannerNumber,
                            price: price.toString(),
                          );
                          setState(() {
                            products.add(newProduct);
                          });
                          Navigator.of(context).pop();
                        } else {
                          // Handle invalid input
                        }
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  void _showEditProductDialog(Product product) {
    TextEditingController nameController =
        TextEditingController(text: product.name);
    TextEditingController quantityController =
        TextEditingController(text: product.quantity.toString());
    TextEditingController scannerNumberController =
        TextEditingController(text: product.scannerNumber.toString());
    TextEditingController priceController =
        TextEditingController(text: product.price);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
            data: ThemeData(
              textTheme:
                  const TextTheme(bodySmall: TextStyle(color: Colors.black)),
              inputDecorationTheme: const InputDecorationTheme(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kBorderColor1),
                ),
                hintStyle: TextStyle(color: kBorderColor1),
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                ),
                child: AlertDialog(
                  title: const Text("Add Product"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                        cursorColor: kBorderColor1,
                      ),
                      TextField(
                        controller: quantityController,
                        decoration:
                            const InputDecoration(labelText: 'Quantity'),
                        keyboardType: TextInputType.number,
                        cursorColor: kBorderColor1,
                      ),
                      TextField(
                        controller: scannerNumberController,
                        decoration:
                            const InputDecoration(labelText: 'Scanner Number'),
                        keyboardType: TextInputType.number,
                        cursorColor: kBorderColor1,
                      ),
                      TextField(
                        controller: priceController,
                        decoration: const InputDecoration(labelText: 'Price'),
                        keyboardType: TextInputType.number,
                        cursorColor: kBorderColor1,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        Labels.cancel(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        String name = nameController.text;
                        int quantity =
                            int.tryParse(quantityController.text) ?? 0;
                        int scannerNumber =
                            int.tryParse(quantityController.text) ?? 0;
                        double price =
                            double.tryParse(priceController.text) ?? 0.0;

                        if (name.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(Labels.error()),
                                content: Text(Labels.nameIsMissing()),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(Labels.ok()),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          Product editedProduct = Product(
                            name: name,
                            quantity: quantity,
                            scannerNumber: scannerNumber,
                            price: price.toString(),
                          );
                          setState(() {
                            int index = products.indexOf(product);
                            products[index] = editedProduct;
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        Labels.save(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

class Product {
  final String name;
  final String price;
  int quantity;
  final int scannerNumber;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    required this.scannerNumber,
  });
}

class ProductBlock extends StatelessWidget {
  final Product product;
  final VoidCallback onDelete;
  final Function(Product) onUpdate;
  final VoidCallback onEdit;

  const ProductBlock({
    super.key,
    required this.product,
    required this.onDelete,
    required this.onUpdate,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: kBorderColor1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${Labels.quantity()}: ${product.quantity}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    if (product.quantity > 0) {
                                      onUpdate(Product(
                                        name: product.name,
                                        price: product.price,
                                        quantity: product.quantity - 1,
                                        scannerNumber: product.scannerNumber,
                                      ));
                                    }
                                  },
                                ),
                                Text(
                                  product.quantity.toString(),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    onUpdate(Product(
                                      name: product.name,
                                      price: product.price,
                                      quantity: product.quantity + 1,
                                      scannerNumber: product.scannerNumber,
                                    ));
                                  },
                                ),
                              ],
                            ),
                            Text(
                              '${Labels.scannerNumber()}: ${product.quantity}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    product.price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    onEdit();
                  },
                  child: const Icon(Icons.edit),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(Labels.deleteItem()),
                          content: Text(Labels.doYouWantToDeleteThisItem()),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                Labels.no(),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                onDelete();
                              },
                              child: Text(
                                Labels.yes(),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
