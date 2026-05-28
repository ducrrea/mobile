import 'package:flutter/material.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: "PetShop SqLite",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.pink),
    home: HomeScreen(),
  ));
}