import 'package:exercicio_foto_gps/view/lista_registros_view.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SenaiCheckInApp());
}

class SenaiCheckInApp extends StatelessWidget {
  const SenaiCheckInApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SENAI CheckIn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ListaRegistrosView(),
      debugShowCheckedModeBanner: false,
    );
  }
}