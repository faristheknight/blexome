import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:pos/constants.dart';
import 'package:pos/database/shop.dart';
import 'package:pos/database/shop_dao.dart';
import 'package:pos/database/user.dart';
import 'package:pos/database/user_dao.dart';
import 'package:pos/labels.dart';
import 'package:pos/screens/Shops/shops.dart';
import 'package:pos/screens/selectLanguagesScreen/components/language_button.dart';
import 'package:sqflite/sqflite.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyClass extends StatefulWidget {
  const MyClass({super.key});

  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  bool _showLanguageButtons = false;
  late YoutubePlayerController _controller;
  bool _isMuted = true; // Variable to track mute state


   Future<Database> _getDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return openDatabase(path);
  }

  Future<void> _insertOrUpdateUser() async {
    final Database db = await _getDatabase();

    // Check if there's an existing user
    List<Map<String, dynamic>> maps = await db.query('user');

    // If there is an existing user, delete it
    if (maps.isNotEmpty) {
      await db.delete('user');
    }

    // Insert new user
    await db.insert(
      'user',
      {
        'userId': '2415',
        'deviceId': 'some_device_id', // Replace with actual device ID if needed
        'sha': 'some_sha', // Replace with actual SHA if needed
        'token': 'some_token', // Replace with actual token if needed
        'expiry': 'some_expiry', // Replace with actual expiry if needed
        'refreshToken': 'some_refresh_token', // Replace with actual refresh token if needed
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'BdHaeczStRA',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: _isMuted, // Initialize mute state
        loop: true,
        controlsVisibleAtStart: true,
        hideControls: false,
        enableCaption: true,
        forceHD: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgrounds/bg_image3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: const SizedBox.expand(),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showLanguageButtons = !_showLanguageButtons;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Text(
                              Labels.languages(),
                              style: const TextStyle(
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: kTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_showLanguageButtons) ...[
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: LanguageButton(
                          text: Labels.english(),
                          onTap: () {
                            print('English Button Pressed');
                          },
                          borderColor: kBorderColor1,
                          textColor: kTextColor,
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 50,
                          borderWidth: 2.0,
                          borderRadius: 100,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: LanguageButton(
                          text: Labels.romanUrdu(),
                          onTap: () {
                            print('Urdu Button Pressed');
                          },
                          borderColor: kBorderColor1,
                          textColor: kTextColor,
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 50,
                          borderWidth: 2.0,
                          borderRadius: 100,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: LanguageButton(
                          text: Labels.urdu(),
                          onTap: () {
                            print('اردو Button Pressed');
                          },
                          borderColor: kBorderColor1,
                          textColor: kTextColor,
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 50,
                          borderWidth: 2.0,
                          borderRadius: 100,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Shops(),
                          ),
                        );
                      },
                      child: Container(
                        width: 129,
                        height: 150,
                        child: Column(
                          children: [
                            const ImageIcon(
                              AssetImage('assets/images/shop.png'),
                              size: 100,
                              color: kTextColor,
                            ),
                            Text(
                              Labels.shops(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 17.7,
                                color: kTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                   GestureDetector(
  onTap: () async {
    // Fetch userId from local database
    UserDao userDao = UserDao();
    User? user = await userDao.getUser();
    if (user != null) {
      String userId = user.userId;

      // Call Flask API with userId
      var url = Uri.parse('http://your_flask_api_url/get_shops');
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'userId': userId}),
      );

      if (response.statusCode == 200) {
        List<dynamic> shopsData = jsonDecode(response.body);

        // Store shops data in local database
        ShopDao shopDao = ShopDao();
        for (var shop in shopsData) {
          await shopDao.insertShop(Shop(
            shop: shop['shop_name'],
            inuse: shop['shopId'].toString(),
          ));
        }
      }

      // Navigate to the Shops screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Shops(),
        ),
      );
    }
  },
  child: Container(
    width: 129,
    height: 150,
    child: Column(
      children: [
        const ImageIcon(
          AssetImage('assets/images/shop.png'),
          size: 100,
          color: kTextColor,
        ),
        Text(
          Labels.shops(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17.7,
            color: kTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  ),
),
                    const SizedBox(height: 40),
                    const Text(
                      "Learn how to use the app",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: kTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    // YouTube video
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: YoutubePlayer(
                        controller: _controller,
                        topActions: [
                          IconButton(
                              color: Colors.white,
                              // Change the icon dynamically based on the mute state
                              icon: _isMuted
                                  ? const Icon(Icons.volume_off)
                                  : const Icon(Icons.volume_up),
                              onPressed: () {
                                setState(() {
                                  // Toggle the mute state
                                  _isMuted = !_isMuted;
                                  // Toggle mute state using YoutubePlayerController
                                  if (_isMuted) {
                                    _controller.mute();
                                  } else {
                                    _controller.unMute();
                                  }
                                });
                              })
                        ],
                        aspectRatio: 16 / 9,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: kTextColor,
                        progressColors: const ProgressBarColors(
                          playedColor: Colors.amber,
                          handleColor: Color.fromARGB(255, 145, 133, 91),
                        ),
                        onReady: () {
                          // Add your logic here when the video is ready to play
                        },
                        onEnded: (YoutubeMetaData metaData) {
                          // Add your logic here when the video ends
                        },
                        // onError: (YoutubePlayerError error) {
                        //   // Handle errors here
                        //   print('Error occurred: $error');
                        // },
                        // onVideoProgress: (Duration duration) {
                        //   // Add your logic to track video progress
                        // },
                      ),
                    ),
                    const SizedBox(height: 75),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
