import 'package:flutter/material.dart';

import '../../../CommonWidgets/blexome.dart';
import '../../../CommonWidgets/button.dart';
import '../../../CommonWidgets/heading.dart';
import '../../../constants.dart';
import '../../../labels.dart';
import '../components/text_field_widget.dart';


class SignUpThirdPage extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordconfirmationController;

  final void Function() onNext;
  final void Function() onBack;

  SignUpThirdPage({
    required this.emailController,
    required this.passwordController,
    required this.passwordconfirmationController,
    required this.onBack,
    required this.onNext,
  });

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
                    hintText: Labels.emailOptional(),
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
                    controller: emailController,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 12.0),
                  ),
                  LoginTextFieldsWidget(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 12.0),
                    textInputType: TextInputType.text,
                    text: '',
                    hintText: Labels.password(),
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
                    obscureText: true,
                    maxlines: 1,
                    controller: passwordController,
                  ),
                  LoginTextFieldsWidget(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 12.0),
                    textInputType: TextInputType.text,
                    text: '',
                    hintText: Labels.confirmPassword(),
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
                    obscureText: true,
                    maxlines: 1,
                    controller: passwordconfirmationController,
                  ),
                  const SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: LanguageButton(
                          text: Labels.back(),
                          onTap: onBack,
                          borderColor: kBorderColor2,
                          textColor: kTextColor,
                          width: 120,
                          height: 50,
                          borderWidth: 2,
                          borderRadius: 50,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: LanguageButton(
                          text: Labels.next(),
                          onTap: () {
                            if (passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(Labels
                                        .passwordShouldcontaineightletters())),
                              );
                            } else if (passwordController.text.length < 8) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(Labels
                                        .passwordShouldcontaineightletters())),
                              );
                            }
                            // else if (passwordController.text !=
                            //     passwordconfirmationController.text) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(
                            //         content:
                            //             Text(Labels.passwordsDoNotMatch())),
                            //   );
                            // }
                            else {
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
