import 'package:flutter/material.dart';

import '../../../CommonWidgets/blexome.dart';
import '../../../CommonWidgets/button.dart';
import '../../../CommonWidgets/heading.dart';
import '../../../constants.dart';
import '../../../labels.dart';
import '../components/text_field_widget.dart';


class SignUpSecondPage extends StatelessWidget {
  final TextEditingController cityController;
  final void Function() onNext;
  final void Function() onBack;

  SignUpSecondPage(
      {required this.cityController,
      required this.onNext,
      required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Image.asset(
            'assets/backgrounds/bg_image2.png',
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Column(
              children: [
                BlexoMeHeading(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  blexoColor: kBorderColor1,
                  meColor: kBorderColor2,
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(1),
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.89,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 30,
                    child: Heading(
                      text: Labels.signup(),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      textColor: kTextColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Dropdown for country
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: Labels.selectCountry(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: kBorderColor1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: kBorderColor2,
                        ),
                      ),
                    ),
                    value: Labels.pakistan(), // Only one option: Pakistan
                    items: [Labels.pakistan()].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // Handle value change
                    },
                  ),
                  const SizedBox(height: 10),
                  // Dropdown for provinces
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: Labels.selectProvince(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: kBorderColor1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: kBorderColor2,
                        ),
                      ),
                    ),
                    value: Labels.punjab(), // Default value
                    items: [
                      Labels.punjab(),
                      Labels.sindh(),
                      Labels.gilgitBaltistan(),
                      Labels.khyberPakhtunkhwa(),
                      Labels.balochistan()
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // Handle value change
                    },
                  ),
                  const SizedBox(height: 10),
                  // Text field for city
                  LoginTextFieldsWidget(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    textInputType: TextInputType.text,
                    text: '',
                    hintText: Labels.city(),
                    onChanged: null,
                    filledColor: Colors.white,
                    borderColor: kBorderColor2,
                    textColor: kTextColor,
                    width: MediaQuery.of(context).size.width * 0.82,
                    height: 60,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(30),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    iconColor: Colors.black,
                    obscureText: false,
                    maxlines: 10,
                    controller: cityController,
                  ),
                  const SizedBox(height: 40.0),

                  Row(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: LanguageButton(
                          text: Labels.back(),
                          onTap: () {
                            onBack();
                          },
                          borderColor: kBorderColor2,
                          textColor: kTextColor,
                          width: 120,
                          height: 50,
                          borderWidth: 2,
                          borderRadius: 50,
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: LanguageButton(
                          text: Labels.next(),
                          onTap: () {
                            if (cityController.text.isEmpty) {
                              // Show an error message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(Labels.cityIsRequired())),
                              );
                            } else {
                              // Move to the next step
                              onNext();
                            }
                          },
                          borderColor: kBorderColor2,
                          textColor: kTextColor,
                          width: 120,
                          height: 50,
                          borderWidth: 2,
                          borderRadius: 50,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
