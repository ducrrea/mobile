import 'dart:io';
import 'package:exercicio_foto_gps/controller/registro_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../models/registro_model.dart';

class NovoRegistroView extends StatefulWidget {
  const NovoRegistroView({Key? key}) : super(key: key);

  @override
  State<NovoRegistroView> createState() => _NovoRegistroViewState();
}

class _NovoRegistroViewState extends State<NovoRegistroView> {
  final _controller = RegistroController();
  final _obsController = TextEditingController();

  String? _caminhoFoto;
  Position? _posicaoAtual;
  bool _carregando = false;

  @override
  void initState() {
    super.initState();
    _obterLocalizacao();
  }

  Future<void> _obterLocalizacao() async {
    setState(() => _carregando = true);
    bool permissoesOk = await _controller.solicitarPermissoes();
    
    if (permissoesOk) {
      Position? pos = await _controller.obterLocalizacaoAtual();
      setState(() {
        _posicaoAtual = pos;
        _carregando = false;
      });
    } else {
      setState(() => _carregando = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permissões de GPS e Câmera são necessárias.')),
        );
      }
    }
  }

  Future<void> _tirarFoto() async {
    String? caminho = await _controller.capturarFoto();
    if (caminho != null) {
      setState(() => _caminhoFoto = caminho);
    }
  }

  Future<void> _salvar() async {
    if (_caminhoFoto == null || _posicaoAtual == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('A foto e a localização são obrigatórias.')),
      );
      return;
    }

    final novoRegistro = RegistroModel(
      dataHora: DateTime.now().toString().substring(0, 19),
      latitude: _posicaoAtual!.latitude,
      longitude: _posicaoAtual!.longitude,
      observacao: _obsController.text,
      caminhoFoto: _caminhoFoto!,
    );

    await _controller.inserirRegistro(novoRegistro);
    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Registro de Ponto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _tirarFoto,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
                child: _caminhoFoto != null
                    ? Image.file(File(_caminhoFoto!), fit: BoxFit.cover)
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                          Text('Toque para tirar foto'),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 16),
            _carregando
                ? const CircularProgressIndicator()
                : Text(
                    _posicaoAtual != null
                        ? 'GPS: ${_posicaoAtual!.latitude.toStringAsFixed(4)},${_posicaoAtual!.longitude.toStringAsFixed(4)}'
                        : 'GPS não obtido',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
            const SizedBox(height: 16),
            TextField(
              controller: _obsController,
              decoration: const InputDecoration(
                labelText: 'Observação/Diário de Campo',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvar,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text('Salvar CheckIn', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}