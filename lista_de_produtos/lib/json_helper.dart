
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class JsonHelper {
  // Método privado para localizar ou criar o arquivo 'produtos.json'
  static Future<File> _getArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/produtos.json");
  }

  // Método para ler os dados salvos no JSON e retornar como uma Lista
  static Future<List<dynamic>> lerDados() async {
    try {
      final arquivo = await _getArquivo();

      if (await arquivo.exists()) {
        String conteudo = await arquivo.readAsString();
        return json.decode(conteudo);
      }
    } catch (e) {
      print("Erro ao ler o arquivo JSON: $e");
    }
    // Retorna uma lista vazia caso o arquivo ainda não exista ou ocorra um erro
    return [];
  }

  // Método para converter a lista de produtos em String JSON e gravar no arquivo
  static Future<void> salvarDados(List<dynamic> dados) async {
    final arquivo = await _getArquivo();
    String jsonString = json.encode(dados);
    await arquivo.writeAsString(jsonString);
  }
}