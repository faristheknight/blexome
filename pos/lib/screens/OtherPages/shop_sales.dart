import 'package:flutter/material.dart';

class Shopsales extends StatefulWidget {
  const Shopsales({super.key});

  @override
  _ShopsalesState createState() => _ShopsalesState();
}

class _ShopsalesState extends State<Shopsales> {
  get color => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up), // Change the icon as needed
            onPressed: () {},
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Text(
              "Sales",
            )
          ],
        ),
      ),
    );
  }
}
