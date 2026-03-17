import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
  );
}
class MyApp extends StatelessWidget {
   MyApp({super.key}); 

  List<String> imagens = [
    "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
    "https://images.unsplash.com/photo-1521747116042-5a810fda9664",
    "https://images.unsplash.com/photo-1504384308090-c894fdcc538d",
    "https://images.unsplash.com/photo-1518837695005-2083093ee35b",
    "https://images.unsplash.com/photo-1501594907352-04cda38ebc29",
    "https://images.unsplash.com/photo-1519681393784-d120267933ba",
    "https://images.unsplash.com/photo-1531259683007-016a7b628fc3",
    "https://images.unsplash.com/photo-1506619216599-9d16d0903dfd",
    "https://images.unsplash.com/photo-1494172961521-33799ddd43a5",
    "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Galeria de Imagens"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
          //carrossel de imagens da Galeria
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                autoPlay: true
              ),
              items: imagens.map(
                ((url)=>Container(
                  margin: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(url,fit: BoxFit.cover, width: 1000)
                )
                ))
              ).toList()),
          //Galeria de Imagens
          Expanded(
            child: GridView.builder(
              //como vou montar o grid (Layout do Grid)
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8 ), 
              itemCount: imagens.length,
              itemBuilder: (context,index)=>
                GestureDetector(
                  onTap:() => _mostrarImagem(context,index),
                  child: ClipRRect(borderRadius: BorderRadius.circular(8),
                  child: Image.network(imagens[index],fit: BoxFit.cover,),),
                )
              ))

          ],

        ),
      ),
    );
  }
  
  void _mostrarImagem(BuildContext context, int index) {
    showDialog(
      context: context, 
      builder: (context)=> Dialog(
        child: Image.network(imagens[index]),
      ));
  }

  
}