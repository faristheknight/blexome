import 'package:flutter/material.dart';
import 'package:pos/constants.dart';
import 'package:pos/labels.dart';
import 'package:pos/screens/selectLanguagesScreen/components/language_button.dart';

class SelectLanguagesScreen extends StatelessWidget {
  const SelectLanguagesScreen({super.key});
  // final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/bg_image3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.8, // Specify height here
                child: Column(
                  children: [
                    Text(
                      Labels.languages(),
                      style: const TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    LanguageButton(
                        text: Labels.english(),
                        onTap: () {
                          print('English Button Pressed');
                        },
                        borderColor: kBorderColor1,
                        textColor: kTextColor,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 70,
                        borderWidth: 4.0,
                        borderRadius: 100),
                    const SizedBox(
                      height: 20,
                    ),
                    LanguageButton(
                        text: Labels.romanUrdu(),
                        onTap: () {
                          print('Urdu Button Pressed');
                        },
                        borderColor: kBorderColor1,
                        textColor: kTextColor,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 70,
                        borderWidth: 4.0,
                        borderRadius: 100),
                    const SizedBox(
                      height: 20,
                    ),
                    LanguageButton(
                        text: Labels.urdu(),
                        onTap: () {
                          print('اردو Button Pressed');
                        },
                        borderColor: kBorderColor1,
                        textColor: kTextColor,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 70,
                        borderWidth: 4.0,
                        borderRadius: 100)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
