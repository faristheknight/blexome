import 'package:flutter/material.dart';

import '../../CommonWidgets/blexome.dart';
import '../../CommonWidgets/button.dart';
import '../../CommonWidgets/heading.dart';
import '../../constants.dart';
import '../../labels.dart';
import 'components/text_field_widget.dart';


class Login extends StatelessWidget {
  const Login({super.key});

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
                    meColor: kBorderColor2)
              ],
            ),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.all(16.0),
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
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    child: Heading(
                        text: Labels.login(),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        textColor: kTextColor),
                  ),
                  LoginTextFieldsWidget(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 12.0),
                    textInputType: TextInputType.text,
                    text: '',
                    hintText: Labels.emailPhoneNumberCNIC(),
                    onChanged: null,
                    filledColor: Colors.white,
                    borderColor: kBorderColor2,
                    textColor: kTextColor,
                    width: MediaQuery.of(context).size.width * .75,
                    height: 40,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(30),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    iconColor: Colors.black,
                    obscureText: false,
                    maxlines: 1,
                  ),
                  const SizedBox(height: 10.0),
                  LoginTextFieldsWidget(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 12.0),
                    textInputType: TextInputType.text,
                    text: '',
                    hintText: Labels.password(),
                    onChanged: null,
                    filledColor: Colors.white,
                    borderColor: kBorderColor2,
                    textColor: kTextColor,
                    width: MediaQuery.of(context).size.width * .75,
                    height: 40,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(30),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    iconColor: Colors.black,
                    obscureText: true,
                    maxlines: 1,
                  ),
                  const SizedBox(height: 40.0),
                  LanguageButton(
                      text: Labels.login(),
                      onTap: () {},
                      borderColor: kBorderColor2,
                      textColor: kTextColor,
                      width: 120,
                      height: 50,
                      borderWidth: 2,
                      borderRadius: 50),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      Labels.forgotPassword(),
                      style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
