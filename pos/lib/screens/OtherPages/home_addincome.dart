import 'package:flutter/material.dart';
import 'package:pos/constants.dart';
// import 'package:pos/labels.dart';
// import 'package:pos/screens/ProfitAndSalesScreen/components/profit_and_sales_widget.dart';
import 'package:pos/screens/ScannerScreens/components/ScannerWidgets/scanner_textfields_widget.dart';

class Addincome extends StatefulWidget {
  const Addincome({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AddincomeState createState() => _AddincomeState();
}

class _AddincomeState extends State<Addincome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.volume_up), // Change the icon as needed
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              const Text(
                "Add Income",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kTextColor),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const Addincome(),
                            //   ),
                            // );
                          },
                          child: Column(
                            children: [
                              TextFieldsWidget(
                                filledColor: Colors.white,
                                onChanged: (value) {},
                                hintText: 'Add Text',
                                text: 'From',
                                borderColor: const Color(0xFF49688D),
                                textColor: const Color(0xFF49688D),
                                width: 220,
                                height: 40,
                                borderWidth: 1,
                                borderRadius: BorderRadius.circular(100),
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                iconColor: const Color(0xFF49688D),
                              ),
                              const SizedBox(
                                  height:
                                      20), // Add spacing between text fields
                              TextFieldsWidget(
                                filledColor: Colors.white,
                                onChanged: (value) {},
                                hintText: 'Add Amount',
                                text: 'Amount',
                                borderColor: const Color(0xFF49688D),
                                textColor: const Color(0xFF49688D),
                                width: 220,
                                height: 40,
                                borderWidth: 1,
                                borderRadius: BorderRadius.circular(100),
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                iconColor: const Color(0xFF49688D),
                              ),
                              const SizedBox(
                                  height:
                                      20), // Add spacing between text fields
                              TextFieldsWidget(
                                filledColor: Colors.white,
                                onChanged: (value) {},
                                hintText: 'Add Details',
                                text: 'Details',
                                borderColor: const Color(0xFF49688D),
                                textColor: const Color(0xFF49688D),
                                width: 220,
                                height: 180,
                                borderWidth: 1,
                                borderRadius: BorderRadius.circular(20),
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                iconColor: const Color(0xFF49688D),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // String _getFieldText(int index) {
  //   switch (index) {
  //     case 0:
  //       return Labels.name();
  //     case 1:
  //       return Labels.quantity();
  //     case 2:
  //       return Labels.cost();
  //     case 3:
  //       return Labels.sellingPrice();
  //     default:
  //       return '';
  //   }
  // }

  // String _getHintText(int index) {
  //   switch (index) {
  //     case 0:
  //       return Labels.namehint();
  //     case 1:
  //       return Labels.quantityhint();
  //     case 2:
  //       return Labels.purchasehint();
  //     case 3:
  //       return Labels.sellingPricehint();
  //     default:
  //       return '';
  //   }
  // }
}
