import 'package:flutter/material.dart';
import 'package:pos/CommonWidgets/blexome.dart';
import 'package:pos/CommonWidgets/heading.dart';
import 'package:pos/constants.dart';
import 'package:pos/screens/LoginSignupScreens/components/text_field_widget.dart';
import 'package:pos/screens/selectLanguagesScreen/components/language_button.dart';

import 'package:pos/labels.dart';

class SignUpFirstPage extends StatelessWidget {
  final TextEditingController firstnameController;
  final TextEditingController surnameController;
  final TextEditingController cnicController;
  final TextEditingController phonenumberController;
  final void Function() onNext;

  SignUpFirstPage(
      {required this.firstnameController,
      required this.surnameController,
      required this.cnicController,
      required this.phonenumberController,
      required this.onNext});

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
            padding: EdgeInsets.only(top: 100.0),
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
            child: Expanded(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 50,
                      child: Heading(
                        text: Labels.signup(),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        textColor: kTextColor,
                      ),
                    ),
                    LoginTextFieldsWidget(
                      textInputType: TextInputType.text,
                      text: '',
                      hintText: Labels.name(),
                      onChanged: null,
                      filledColor: Colors.white,
                      borderColor: kBorderColor1,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * .5,
                      height: 40,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(30),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      iconColor: Colors.black,
                      obscureText: false,
                      maxlines: 1,
                      controller: firstnameController,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 12.0),
                    ),
                    LoginTextFieldsWidget(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 12.0),
                      textInputType: TextInputType.text,
                      text: '',
                      hintText: Labels.surname(),
                      onChanged: null,
                      filledColor: Colors.white,
                      borderColor: kBorderColor1,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * .6,
                      height: 40,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(30),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      iconColor: Colors.black,
                      obscureText: false,
                      maxlines: 1,
                      controller: surnameController,
                    ),
                    LoginTextFieldsWidget(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 12.0),
                      textInputType: const TextInputType.numberWithOptions(),
                      text: '',
                      hintText: Labels.cnic(),
                      onChanged: null,
                      filledColor: Colors.white,
                      borderColor: kBorderColor1,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * .7,
                      height: 40,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(30),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      iconColor: Colors.black,
                      obscureText: false,
                      maxlines: 1,
                      controller: cnicController,
                    ),
                    LoginTextFieldsWidget(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 12.0),
                      textInputType: const TextInputType.numberWithOptions(),
                      text: '',
                      hintText: Labels.phoneNumber(),
                      onChanged: null,
                      filledColor: Colors.white,
                      borderColor: kBorderColor1,
                      textColor: kTextColor,
                      width: MediaQuery.of(context).size.width * .8,
                      height: 40,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(30),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      iconColor: Colors.black,
                      obscureText: false,
                      maxlines: 1,
                      controller: phonenumberController,
                    ),
                    const SizedBox(height: 40.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: LanguageButton(
                        text: Labels.next(),
                        onTap: () {
                          if (firstnameController.text.isEmpty) {
                            // Show an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(Labels.nameIsRequired())),
                            );
                          } else if (surnameController.text.isEmpty) {
                            // Show an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(Labels.surnameIsRequired())),
                            );
                          } else if (cnicController.text.length < 13) {
                            // Show an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(Labels.incorrectCNIC())),
                            );
                          } else if (cnicController.text.isEmpty) {
                            // Show an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(Labels.cnicIsRequired())),
                            );
                          } else if (phonenumberController.text.isEmpty) {
                            // Show an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text(Labels.phoneNumberIsRequired())),
                            );
                          } else if (phonenumberController.text.length < 11) {
                            // Show an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(Labels.incorrectPhoneNumber())),
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
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
