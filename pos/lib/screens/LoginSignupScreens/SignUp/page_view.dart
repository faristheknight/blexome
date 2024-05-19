import 'package:flutter/material.dart';
import 'package:pos/screens/LoginSignupScreens/SignUp/signupfirstpage.dart';
import 'package:pos/screens/LoginSignupScreens/SignUp/signupsecondpage.dart';
import 'package:pos/screens/LoginSignupScreens/SignUp/signupthirdpage.dart';

class MultiStepForm extends StatefulWidget {
  @override
  _MultiStepFormState createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final PageController _pageController = PageController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordconfirmationcontroller =
      TextEditingController();

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _printValues() {
    print('First Name: ${_firstnameController.text}');
    print('Sir Name: ${_surnameController.text}');
    print('CNIC: ${_cnicController.text}');
    print('Phone Number: ${_phonenumberController.text}');
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
    print('City: ${_cityController.text}');
    print('Confirm Password: ${_passwordconfirmationcontroller.text}');
  }

  @override
  void dispose() {
    _pageController.dispose();
    _firstnameController.dispose();
    _surnameController.dispose();
    _cnicController.dispose();
    _phonenumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordconfirmationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
        children: [
          SignUpFirstPage(
              firstnameController: _firstnameController,
              surnameController: _surnameController,
              cnicController: _cnicController,
              phonenumberController: _phonenumberController,
              onNext: _nextPage),
          SignUpSecondPage(
            cityController: _cityController,
            onNext: _nextPage,
            onBack: _previousPage,
          ),
          SignUpThirdPage(
            emailController: _emailController,
            passwordController: _passwordController,
            passwordconfirmationController: _passwordconfirmationcontroller,
            onNext: _printValues,
            onBack: _previousPage,
          ),
        ],
      ),
    );
  }
}
