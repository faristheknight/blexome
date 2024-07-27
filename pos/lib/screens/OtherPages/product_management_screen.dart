import 'package:flutter/material.dart';

import '../../CommonWidgets/button.dart';
import '../../constants.dart';
import '../../labels.dart';
import '../Products/product_details.dart';
import '../Products/products.dart';


class ProductManagementScreen extends StatefulWidget {
  const ProductManagementScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ProductManagementScreenState createState() =>
      _ProductManagementScreenState();
}

class _ProductManagementScreenState extends State<ProductManagementScreen> {
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
              image: AssetImage("assets/backgrounds/bg_image3.png"),
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
                  Labels.management(),
                  style: const TextStyle(
                    color: kTextColor,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(
                    height: 30), // Optional space between text and container
                Column(
                  children: [
                    LanguageButton(
                        text: Labels.products(),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Products(),
                              ));
                        },
                        borderColor: kBorderColor1,
                        textColor: kTextColor,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 70,
                        borderWidth: 3,
                        borderRadius: 100,
                        textSize: 26),
                    const SizedBox(height: 20),
                    LanguageButton(
                        text: Labels.productDetails(),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductDetails(),
                              ));
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
