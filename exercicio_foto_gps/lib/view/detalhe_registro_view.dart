import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/registro_model.dart';

class DetalheRegistroView extends StatelessWidget {
  final RegistroModel registro;

  const DetalheRegistroView({Key? key, required this.registro}) : super(key: key);

  Future<void> _abrirNoMapa() async {
    final Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=${registro.latitude},${registro.longitude}');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir o mapa.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do CheckIn'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(registro.caminhoFoto),
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text('Data/Hora: ${registro.dataHora}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Text('Coordenadas: ${registro.latitude},${registro.longitude}'),
            const SizedBox(height: 8),
            Text('Observação: ${registro.observacao.isEmpty ? "Sem observações" : registro.observacao}'),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _abrirNoMapa,
              icon: const Icon(Icons.map),
              label: const Text('Abrir Localização no Mapa'),
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
            )
          ],
        ),
      ),
    );
  }
}