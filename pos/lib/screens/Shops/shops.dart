import 'package:flutter/material.dart';

import '../../CommonWidgets/button.dart';
import '../../constants.dart';
import '../../labels.dart';
import '../LoginSignupScreens/SignUp/page_view.dart';
import '../LoginSignupScreens/login.dart';
import '../OtherPages/new_shop_form.dart';
import '../OtherPages/shop_management_screen.dart';

class Shops extends StatefulWidget {
  const Shops({super.key});

  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgrounds/bg_image3.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(),
              const ImageIcon(
                AssetImage('assets/images/shop.png'),
                size: 130,
                color: kTextColor,
              ),
              Text(
                Labels.shop(),
                style: const TextStyle(color: kTextColor, fontSize: 24),
              ),
              const SizedBox(height: 40),
              LanguageButton(
                text: Labels.addShop(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Newformshop(),
                    ),
                  );
                },
                borderColor: kBorderColor1,
                textColor: kTextColor,
                width: MediaQuery.of(context).size.width * 0.8,
                height: 70,
                borderWidth: 3,
                borderRadius: 100,
                textSize: 26,
              ),
              const SizedBox(height: 20),
              LanguageButton(
                text: Labels.shop(),
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShopManagementScreen(),
                    ),
                  );

                  // var status = await Permission.camera.status;
                  // if (status.isGranted) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text('Camera permission granted'),
                  //     ),
                  //   );
                  //   // Proceed with the action that requires camera permission
                  // } else if (status.isPermanentlyDenied) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text('Camera permission permanently denied'),
                  //     ),
                  //   );
                  //   openAppSettings(); // Open app settings
                  // } else {
                  //   status = await Permission.camera.request();
                  //   if (status.isGranted) {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(
                  //         content: Text('Camera permission granted'),
                  //       ),
                  //     );
                  //     // Proceed with the action that requires camera permission
                  //   } else {
                  //     status = await Permission.camera.request();

                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(
                  //         content: Text('Camera permission denied'),
                  //       ),
                  //     );
                  //   }
                  // }
                },
                borderColor: kBorderColor1,
                textColor: kTextColor,
                width: MediaQuery.of(context).size.width * 0.8,
                height: 70,
                borderWidth: 3,
                borderRadius: 100,
                textSize: 26,
              ),
              const SizedBox(height: 20),
              LanguageButton(
                text: 'login',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                borderColor: kBorderColor1,
                textColor: kTextColor,
                width: MediaQuery.of(context).size.width * 0.8,
                height: 70,
                borderWidth: 3,
                borderRadius: 100,
                textSize: 26,
              ),

               const SizedBox(height: 20),
               
              LanguageButton(
                text: 'Signup',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },
                borderColor: kBorderColor1,
                textColor: kTextColor,
                width: MediaQuery.of(context).size.width * 0.8,
                height: 70,
                borderWidth: 3,
                borderRadius: 100,
                textSize: 26,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
