import 'package:flutter/material.dart';
import 'package:pos/screens/Shops/shops.dart';
import 'package:pos/screens/selectLanguagesScreen/components/language_button.dart';
import 'package:pos/labels.dart';
import 'package:pos/constants.dart';
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
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const HomeManagementPage(),
                        //   ),
                        // );
                      },
                      child: Container(
                        width: 1570,
                        height: 180,
                        child: Column(
                          children: [
                            const ImageIcon(
                              AssetImage('assets/images/home.png'),
                              size: 100,
                              color: kTextColor,
                            ),
                            Text(
                              Labels.homeManagementComingSoon(),
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
