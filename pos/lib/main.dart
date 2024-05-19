import 'package:flutter/material.dart';
import 'package:pos/screens/HomeScreen/home.dart';

void main() {
  runApp(PosApp());
}

class PosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      title: 'POS App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/myclass': (context) => const MyClass(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up), // Volume icon
            onPressed: () {
              // Add volume functionality here
            },
          ),
        ],
      ),
      body: const Center(
        child: MyClass(), // Displaying MyClass instead of buttons
      ),
    );
  }
}
