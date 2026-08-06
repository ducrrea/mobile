import 'package:flutter/material.dart';
import 'produtos_page.dart';

void main() {
  // Garante que os pacotes nativos do Flutter estejam prontos antes de rodar o app
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: "Cadastro de Produtos JSON",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
    ),
    home: const ProdutosPage(),
  ));
}