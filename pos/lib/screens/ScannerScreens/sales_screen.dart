import 'package:flutter/material.dart';
import 'package:pos/labels.dart';
import 'package:pos/CommonWidgets/heading.dart';
import 'package:pos/constants.dart';
// import 'package:pos/CommonWidgets/profit_and_sales_widget.dart';
import 'package:pos/screens/ScannerScreens/components/Scanner/scanner.dart';
import 'package:pos/screens/ScannerScreens/components/ScannerWidgets/scanner_textfields_widget.dart';
import 'package:pos/CommonWidgets/button.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  _SalesScreenState createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  // String variables to store text field values
  String name = '';
  String quantity = '';
  String cost = '';
  String sellingPrice = '';

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPaddin),
                  child: Heading(
                    text: Labels.sales(),
                    fontSize: 32.4,
                    fontWeight: FontWeight.bold,
                    textColor: const Color(0xFF49688D),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Scanner(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4, // Number of text fields
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 5),
                        child: TextFieldsWidget(
                          filledColor: Colors.white,
                          onChanged: (value) {
                            // Update corresponding String variable based on index
                            switch (index) {
                              case 0:
                                setState(() {
                                  name = value;
                                });
                                break;
                              case 1:
                                setState(() {
                                  quantity = value;
                                });
                                break;
                              case 2:
                                setState(() {
                                  cost = value;
                                });
                                break;
                              case 3:
                                setState(() {
                                  sellingPrice = value;
                                });
                                break;
                            }
                          },
                          hintText: _getHintText(index),
                          text: _getFieldText(index),
                          borderColor: const Color(0xFF49688D),
                          textColor: const Color(0xFF49688D),
                          width: 220,
                          height: 40,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(100),
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
                    text: Labels.sell(),
                    onTap: () {
                      // Use the stored values here as needed
                      print('Name: $name');
                      print('Quantity: $quantity');
                      print('Cost: $cost');
                      print('Selling Price: $sellingPrice');
                    },
                    borderColor: const Color(0xFF9AD0D3),
                    textColor: const Color(0xFF49688D),
                    width: 100,
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
        return Labels.cost();
      case 3:
        return Labels.sellingPrice();
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
      default:
        return '';
    }
  }
}
