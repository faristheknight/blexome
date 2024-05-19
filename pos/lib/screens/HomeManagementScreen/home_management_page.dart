import 'package:flutter/material.dart';
import 'package:pos/Screens/OtherPages/home_expenses.dart';
import 'package:pos/Screens/OtherPages/home_income.dart';
import 'package:pos/constants.dart';
// import 'package:pos/labels.dart';
import 'package:pos/CommonWidgets/button.dart';

class HomeManagementPage extends StatefulWidget {
  const HomeManagementPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomeManagementPageState createState() => _HomeManagementPageState();
}

class _HomeManagementPageState extends State<HomeManagementPage> {
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
                "Home Management",
                style: TextStyle(fontSize: 18, color: kTextColor),
              ),

              const SizedBox(
                  height: 40), // Optional space between text and container
              Column(
                children: [
                  LanguageButton(
                      text: 'Income',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homeincome()),
                        );
                      },
                      borderColor: kBorderColor2,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 70,
                      borderWidth: 4,
                      borderRadius: 100,
                      textSize: 26),
                  const SizedBox(height: 20),
                  LanguageButton(
                      text: 'Expenses',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homeexpenses()),
                        );
                      },
                      borderColor: kBorderColor2,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 70,
                      borderWidth: 4,
                      borderRadius: 100,
                      textSize: 26),
                  const SizedBox(height: 20),
                  LanguageButton(
                      text: 'Digital Report',
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const Homeincome()),
                        // );
                      },
                      borderColor: kBorderColor2,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 70,
                      borderWidth: 4,
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
