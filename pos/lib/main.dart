import 'package:flutter/material.dart';
import 'package:pos/screens/HomeScreen/home.dart';

void main() {
  runApp(const PosApp());
}

class PosApp extends StatelessWidget {
  const PosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      title: 'POS App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/myclass': (context) => const MyClass(),
      },
 
      builder: (context, child){
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)), child:  child!,
        );
      },
    
      
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
