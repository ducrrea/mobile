import 'package:flutter/material.dart';
import 'package:intro_interacao/pages/contato_page.dart';
import 'package:intro_interacao/pages/form_page.dart';
import 'package:intro_interacao/pages/home_page.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    routes: {
      "/":(context) => HomePage(),
      "/form":(context) => FormPage(),
      "/contato":(context) => ContatoPage(),
    },

    initialRoute: "/",
  ));
}