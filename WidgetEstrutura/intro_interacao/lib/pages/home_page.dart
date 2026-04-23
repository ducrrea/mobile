import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meu App Interativo"),),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://cidade.fm/upload/2025/09/imagem-site-news-cddfm-91-35254.jpg",
              width: 150,
              height: 150,),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed:() => Navigator.pushNamed(context, "/form"), 
                child: Text("Ir para o Formulário")),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/contato"),
                child: Text("Ir para o Contato")),
            ],
          ),
        ),),
    );
  }
}