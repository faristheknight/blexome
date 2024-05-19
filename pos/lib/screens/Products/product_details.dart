import 'package:flutter/material.dart';
import 'package:pos/labels.dart';
import 'package:pos/CommonWidgets/heading.dart';
import 'package:pos/constants.dart';
import 'package:pos/screens/ScannerScreens/components/Scanner/scanner.dart';
import 'package:pos/screens/ScannerScreens/components/ScannerWidgets/scanner_textfields_widget.dart';
import 'package:pos/CommonWidgets/button.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String name = '';
  int quantity = 0;
  int price = 0;
  int sellingPrice = 0;
  int scannerNumber = 0;
  String details = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/backgrounds/bg_image1.png',
                fit: BoxFit.contain,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: kDefaultPaddin, left: kDefaultPaddin),
                  child: Heading(
                    text: Labels.details(),
                    fontSize: 32.4,
                    fontWeight: FontWeight.bold,
                    textColor: const Color(0xFF49688D),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                  child: const Scanner(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6, // Number of text fields
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 5),
                        child: TextFieldsWidget(
                          filledColor: Colors.white,
                          onChanged: (value) {
                            // Update corresponding int variable based on index
                            switch (index) {
                              case 0:
                                setState(() {
                                  name = value;
                                });
                                break;
                              case 1:
                                setState(() {
                                  quantity = int.tryParse(value) ?? 0;
                                });
                                break;
                              case 2:
                                setState(() {
                                  price = int.tryParse(value) ?? 0;
                                });
                                break;
                              case 3:
                                setState(() {
                                  sellingPrice = int.tryParse(value) ?? 0;
                                });
                                break;
                            }
                          },
                          hintText: _getHintText(index),
                          text: _getFieldText(index),
                          borderColor: const Color(0xFF49688D),
                          textColor: const Color(0xFF49688D),
                          width: 220,
                          height: _getHeightOfTextfields(index),
                          borderWidth: 1,
                          borderRadius:
                              BorderRadius.circular(_getBorderRadius(index)),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          iconColor: const Color(0xFF49688D),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160.0),
                  child: LanguageButton(
                    text: Labels.enter(),
                    onTap: () {
                      // Use the stored values here as needed
                      // print('Name: $name');
                      // print('Quantity: $quantity');
                      // print('Price: $price');
                      // print('Selling Price: $sellingPrice');
                    },
                    borderColor: const Color(0xFF9AD0D3),
                    textColor: const Color(0xFF49688D),
                    width: 120,
                    height: 50,
                    borderWidth: 2,
                    borderRadius: 300,
                    textSize: 24,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getFieldText(int index) {
    switch (index) {
      case 0:
        return Labels.name();
      case 1:
        return Labels.quantity();
      case 2:
        return Labels.price();
      case 3:
        return Labels.sellingPrice();
      case 4:
        return Labels.barcode();
      case 5:
        return Labels.details();
      default:
        return '';
    }
  }

  String _getHintText(int index) {
    switch (index) {
      case 0:
        return Labels.namehint();
      case 1:
        return Labels.quantityhint();
      case 2:
        return Labels.purchasehint();
      case 3:
        return Labels.sellingPricehint();
      case 4:
        return Labels.scannerNumber();
      case 5:
        return Labels.details();

      default:
        return '';
    }
  }

  double _getHeightOfTextfields(int index) {
    switch (index) {
      case 0:
        return 40.0;
      case 1:
        return 40.0;
      case 2:
        return 40.0;
      case 3:
        return 40.0;
      case 4:
        return 40.0;
      case 5:
        return 150.0;

      default:
        return 40.0;
    }
  }

  double _getBorderRadius(int index) {
    switch (index) {
      case 0:
        return 100.0;
      case 1:
        return 100.0;
      case 2:
        return 100.0;
      case 3:
        return 100.0;
      case 4:
        return 100.0;
      case 5:
        return 30.0;

      default:
        return 40.0;
    }
  }
}
