import 'package:flutter/material.dart';

import '../../CommonWidgets/button.dart';
import '../../constants.dart';
import 'home_addexpenses.dart';


class Homeexpenses extends StatefulWidget {
  const Homeexpenses({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomeexpensesState createState() => _HomeexpensesState();
}

class _HomeexpensesState extends State<Homeexpenses> {
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
                "Expenses",
              ),

              const SizedBox(
                  height: 40), // Optional space between text and container
              Column(
                children: [
                  LanguageButton(
                      text: 'Add Expenses',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Addexpenses()),
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
                      onTap: () {},
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
