import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../labels.dart';


class Newformshop extends StatefulWidget {
  const Newformshop({super.key});

  @override
  _NewformshopState createState() => _NewformshopState();
}

class _NewformshopState extends State<Newformshop> {
  late String _shopName;
  late String _shopkeeperName;
  late String _selectedCategory;
  late String _selectedCountry;
  late String _selectedCity;
  late String _phoneNumber;

  final _categories = [
    Labels.select(),
    Labels.category1(),
    Labels.category2(),
    Labels.category3(),
    Labels.category4(),
  ];
  final _cities = [
    Labels.select(),
    // 'Islamabad',
    // 'Lahore',
    Labels.rabwah(),
    Labels.chiniot(),
  ];
  final _countries = [
    Labels.select(),
    Labels.pakistan(),
    // 'India',
    // 'United States',
    // 'United Kingdom'
  ];

  void _resetForm() {
    setState(() {
      _shopName = '';
      _shopkeeperName = '';
      _selectedCategory = _categories.first;
      _selectedCountry = _countries.first;
      _selectedCity = _cities.first;
      _phoneNumber = '';
    });
  }

  @override
  void initState() {
    super.initState();
    _shopName = '';
    _shopkeeperName = '';
    _selectedCategory = _categories.first; // Initialize with the first category
    _selectedCountry = _countries.first; // Initialize with the first country
    _selectedCity = _cities.first; // Initialize with the first city
    _phoneNumber = '';
  }

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
        body: Stack(children: [
          SingleChildScrollView(
            // Wrap your Scaffold with SingleChildScrollView
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _shopName = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: Labels.nameOfShop(),
                      hintText: Labels.typeHere(),
                      labelStyle: const TextStyle(color: kTextColor),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _shopkeeperName = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: Labels.nameOfShopKeeper(),
                      hintText: Labels.typeHere(),
                      labelStyle: const TextStyle(color: kTextColor),
                    ),
                  ),
                  const SizedBox(height: 40),
                  DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(40),
                    style: const TextStyle(color: kTextColor),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: Labels.nameOfShopKeeper(),
                      hintText: 'Ok',
                      labelStyle: const TextStyle(color: kTextColor),
                    ),
                    value: _selectedCategory,
                    items: _categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 40),
                  DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(40),
                    style: const TextStyle(color: kTextColor),
                    onChanged: (value) {
                      setState(() {
                        _selectedCountry = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: Labels.country(),
                      hintText: 'Select country',
                      labelStyle: const TextStyle(color: kTextColor),
                    ),
                    value: _selectedCountry,
                    items: _countries.map((String country) {
                      return DropdownMenuItem<String>(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 40),
                  DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(40),
                    style: const TextStyle(color: kTextColor),
                    onChanged: (value) {
                      setState(() {
                        _selectedCity = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: Labels.city(),
                      hintText: Labels.selectCity(),
                      labelStyle: const TextStyle(color: kTextColor),
                    ),
                    value: _selectedCity,
                    items: _cities.map((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _phoneNumber = value;
                      });
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: Labels.phoneNumber(),
                      hintText: Labels.enterPhoneNumber(),
                      labelStyle: const TextStyle(color: kTextColor),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Perform form submission actions
                      print('Shop Name: $_shopName');
                      print('Shopkeeper Name: $_shopkeeperName');
                      print('Selected Category: $_selectedCategory');
                      print('Selected Country: $_selectedCountry');
                      print('Selected City: $_selectedCity');
                      print('Phone Number: $_phoneNumber');

                      // Reset form after submission
                      _resetForm();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          kTextColor), // Blue color similar to field colors
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              vertical: 16.0)), // Adjust the padding as needed
                    ),
                    child: Text(
                      Labels.submit(),
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
