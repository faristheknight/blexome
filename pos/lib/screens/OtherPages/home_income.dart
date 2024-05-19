import 'package:flutter/material.dart';
// import 'package:pos/screens/home_addexpenses.dart';
import 'package:pos/Screens/OtherPages/home_addincome.dart';
import 'package:pos/constants.dart';
// import 'package:pos/labels.dart';
import 'package:pos/CommonWidgets/button.dart';

class Homeincome extends StatefulWidget {
  const Homeincome({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomeincomeState createState() => _HomeincomeState();
}

class _HomeincomeState extends State<Homeincome> {
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Center(
          child: Column(
            children: [
              const ImageIcon(
                AssetImage('assets/images/home.png'),
                size: 130,
                color: kTextColor,
              ),
              const Text(
                "Income",
                style: TextStyle(
                    fontSize: 24,
                    color: kTextColor,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                  height: 40), // Optional space between text and container
              Column(
                children: [
                  LanguageButton(
                      text: 'Add Income',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Addincome()),
                        );
                      },
                      borderColor: kBorderColor1,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 70,
                      borderWidth: 3,
                      borderRadius: 100,
                      textSize: 26),
                  const SizedBox(height: 30),
                  LanguageButton(
                      text: 'See Details',
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const Addexpenses()),
                        // );
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
    );
  }
}
