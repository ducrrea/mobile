//lógica de persistencia de dados

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class JsonHelper {
  // métodos static => método da classe e nao do obj, ou seja, para usar o método nao precisa instanciar o OBJ
  //1. método para obter o arquivo Json (static)
  static Future<File> _getArquivo() async{
    final diretorio = await getApplicationDocumentsDirectory(); //buscando os arquivos do aplicativo
    return File("${diretorio.path}/bd.json"); //retora o caminho de arquivo json
    //se arquivo nao existir, ele será criado automaticamente
  }


  //2. método para ler todos os dados do Json (converter Json em Map)
  static Future<Map<String,dynamic>> lerDados() async{
    try{
      final arquivo = await  _getArquivo(); //busco arquivo
      //verifico se o arquivo existe
      if(await arquivo.exists()){
        String conteudo = await arquivo.readAsString();
        return json.decode(conteudo);
      }
    }catch (e){
      print("Erro ao ler oo arquivo: $e");
    }
    return{}; //retorna um Map vazio se não existir ou der erro
  }


  //3. método para salvar os dados no arquivo Json
  static void salvarDados(Map<String, dynamic> dados) async{
    final arquivo = await _getArquivo(); //pegando o local do arquivo
    String jsonString = json.encode(dados); // transformando Map em Json
    await arquivo.writeAsString(jsonString); // armaxenando os dados no local
  }
}