import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp (
    home: MyApp()
  ));
}

// importando as características da página stateful
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  //metodo para identificar as mudanças de estado e chamar a rconstrução da janela
  @override //reescrita de um metodo existente
  State<MyApp> createState() => _MyAppState();
}

//class para a contrução dad lógica e da estrutura da janela
class _MyAppState extends State<MyApp>{
  //classe normal de aplicação
  //atributos
  int contador = 0;
  @override
  Widget build (BuildContext context){
    return Scaffold(
      //appbar - titulo do app
      appBar: AppBar(title: Text("Aplicativo com stateful - Contador")),
      //body
      //container para espaçamento interno
      body: Padding(
        padding: EdgeInsets.all(8),//espaçamento interno de 8px em todas as bordas
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,//centraliza os elementos no eixo principal da Column (Y)
            children: [
              Text("N° de Click: $contador", style: TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    contador++;
                  });
                },
                child: Text("Adicionar +1"))
            ],
          ),
        ),
      )
    );
  }
}