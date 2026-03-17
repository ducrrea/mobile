// tela para estudo dos widgets de exibição
//  text, image, icon entre outros

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      //configurações iniciais do App
      //router => rotas de navegação
      //home => pagina Inicial
      home: MyApp(),
      //themeApp => (Claro/Escuro)
    ),
  ); //gosto de colocar o MaterialApp no void main
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //a estrutura da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //elemento principal da tela
      // appbar, drawer, bnBar, body, fabutton, snakebar
      appBar: AppBar(title: Text("Exemplos de widget de exibição")),


      body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(16),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Explorando o Flutter",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Image.network(
                  "https://images.unsplash.com/photo-1773257618958-c2ec3e0d249f?",
                  height: 600,
                  fit: BoxFit.contain,),
                
                Image.asset( "assets/img/tigre.jpg",
                  height: 250,
                  fit: BoxFit.cover,)
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}
