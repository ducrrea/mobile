import 'dart:io';
import 'package:exercicio_foto_gps/controller/registro_controller.dart';
import 'package:flutter/material.dart';
import '../models/registro_model.dart';
import 'novo_registro_view.dart';
import 'detalhe_registro_view.dart';

class ListaRegistrosView extends StatefulWidget {
  const ListaRegistrosView({Key? key}) : super(key: key);

  @override
  State<ListaRegistrosView> createState() => _ListaRegistrosViewState();
}

class _ListaRegistrosViewState extends State<ListaRegistrosView> {
  final RegistroController _controller = RegistroController();
  List<RegistroModel> _registros = [];

  @override
  void initState() {
    super.initState();
    _carregarRegistros();
  }

  Future<void> _carregarRegistros() async {
    final lista = await _controller.obterRegistros();
    setState(() => _registros = lista);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SENAI CheckIn'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _registros.isEmpty
          ? const Center(child: Text('Nenhum registro encontrado.'))
          : ListView.builder(
              itemCount: _registros.length,
              itemBuilder: (context, index) {
                final item = _registros[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(item.caminhoFoto),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(item.dataHora),
                    subtitle: Text('Lat: ${item.latitude.toStringAsFixed(3)} \vert{} Long:${item.longitude.toStringAsFixed(3)}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalheRegistroView(registro: item),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? atualizado = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NovoRegistroView()),
          );
          if (atualizado == true) {
            _carregarRegistros();
          }
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}