import 'package:flutter/material.dart';
import 'package:pos/constants.dart';
import 'package:pos/labels.dart';
// import 'package:pos/screens/ProfitAndSalesScreen/components/profit_and_sales_widget.dart';
import 'package:pos/screens/ProfitAndSalesScreen/profit_and_sales.dart';
// import 'package:pos/screens/ScannerScreens/components/scanner_textfields_widget.dart';
import 'package:pos/CommonWidgets/button.dart';
import 'package:pos/screens/ScannerScreens/sales_screen.dart';

class Shopreports extends StatefulWidget {
  const Shopreports({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ShopreportsState createState() => _ShopreportsState();
}

class _ShopreportsState extends State<Shopreports> {
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
              image: AssetImage("assets/backgrounds/bg_image2.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Center(
            child: Column(
              children: [
                const ImageIcon(
                  AssetImage('assets/images/shop.png'),
                  size: 130,
                  color: kTextColor,
                ),
                Text(
                  Labels.reports(),
                  style: const TextStyle(color: kTextColor, fontSize: 24),
                ),

                const SizedBox(
                    height: 40), // Optional space between text and container
                Column(
                  children: [
                    LanguageButton(
                        text: Labels.sales(),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SalesScreen(),
                              ));
                        },
                        borderColor: kBorderColor1,
                        textColor: kTextColor,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 70,
                        borderWidth: 3,
                        borderRadius: 100,
                        textSize: 26),
                    const SizedBox(height: 15),
                    LanguageButton(
                        text: Labels.profitAndSalesHeading(),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfitAndSales(),
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
        ),
      ]),
    );
  }
}
