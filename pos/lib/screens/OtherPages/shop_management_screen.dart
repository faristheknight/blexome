import 'package:flutter/material.dart';
// import 'package:pos/screens/shop_sales.dart';
import 'package:pos/CommonWidgets/button.dart';
import 'package:pos/Screens/OtherPages/product_management_screen.dart';
import 'package:pos/Screens/OtherPages/shop_reports.dart';
import 'package:pos/constants.dart';
import 'package:pos/labels.dart';
import 'package:pos/screens/ScannerScreens/purchase_screen.dart';
import 'package:pos/screens/ScannerScreens/return_screen.dart';
import 'package:pos/screens/ScannerScreens/sales_screen.dart';


class ShopManagementScreen extends StatefulWidget {
  const ShopManagementScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShopManagementScreenState createState() => _ShopManagementScreenState();
}

class _ShopManagementScreenState extends State<ShopManagementScreen> {
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
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backgrounds/bg_image4.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 20,
              ),

              const ImageIcon(
                AssetImage('assets/images/shop.png'),
                size: 120,
                color: kTextColor,
              ),
              Text(
                Labels.shopManagement(),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: kTextColor),
              ),
              const SizedBox(
                  height: 20), // Optional space between text and container
              Column(
                children: [
                  LanguageButton(
                      text: Labels.sales(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SalesScreen(),
                          ),
                        );
                      },
                      borderColor: kBorderColor1,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 70,
                      borderWidth: 3,
                      borderRadius: 100,
                      textSize: 26),

                  const SizedBox(
                      height: 20), // Optional space between containers
                  LanguageButton(
                      text: Labels.purchase(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Purchase(),
                          ),
                        );
                      },
                      borderColor: kBorderColor1,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 70,
                      borderWidth: 3,
                      borderRadius: 100,
                      textSize: 26),
                  const SizedBox(
                      height: 20), // Optional space between containers
                  LanguageButton(
                      text: Labels.returnLabel(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReturnScreen(),
                          ),
                        );
                      },
                      borderColor: kBorderColor1,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 70,
                      borderWidth: 3,
                      borderRadius: 100,
                      textSize: 26),
                  const SizedBox(
                      height: 20), // Optional space between containers
                  LanguageButton(
                      text: Labels.management(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ProductManagementScreen(),
                          ),
                        );
                      },
                      borderColor: kBorderColor1,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 70,
                      borderWidth: 3,
                      borderRadius: 100,
                      textSize: 26),
                  const SizedBox(
                      height: 20), // Optional space between containers
                  LanguageButton(
                      text: Labels.reports(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Shopreports(),
                          ),
                        );
                      },
                      borderColor: kBorderColor1,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 70,
                      borderWidth: 3,
                      borderRadius: 100,
                      textSize: 26),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
