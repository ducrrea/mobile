import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:3000"; //URL da API
  //obs: declaração de atributos e métodos usa-se lowerCamelCase
  //obs: declaração de classes usa-se UpperCamelCase

  // método de classe para acessar os endpoints da api
  // GET(ALL)
  static Future<List<dynamic>> getList(String path) async {
    //no dart precisa converter String => URL (Uri.parse)
    final res = await http.get(Uri.parse("$baseUrl/$path"));
    if(res.statusCode == 200){
      return jsonDecode(res.body);
    }
    //criando um erro para ser tratado no futuro
    throw Exception("Falha de conexão com a api $path");
  }

  // GET(One)
  static Future<Map<String,dynamic>> getOne(String path, String id) async{
    final res = await http.get(Uri.parse("$baseUrl/$path/$id"));
    if(res.statusCode == 200){
      return jsonDecode(res.body);
    }
    throw Exception("Falha de conexão com a api $path/$id");
  }

  // POST
  static Future<Map<String,dynamic>> post(String path, Map<String,dynamic> data) async{
    final res = await http.post(Uri.parse("$baseUrl/$path"), body: jsonEncode(data), headers: {"Content-Type": "application/json"});
    if(res.statusCode == 201){
      return jsonDecode(res.body);
    }
    throw Exception("Falha de conexão com a api $path");
  }
  // PUT
  static Future<Map<String,dynamic>> put(String path, String id, Map<String,dynamic> data) async{
    final res = await http.put(Uri.parse("$baseUrl/$path/$id"), body: jsonEncode(data), headers: {"Content-Type": "application/json"});
    if(res.statusCode == 200){
      return jsonDecode(res.body);
    }
    throw Exception("Falha de conexão com a api $path/$id");
  }
  // DELETE
  static Future<Map<String,dynamic>> delete(String path, String id) async{
    final res = await http.delete(Uri.parse("$baseUrl/$path/$id"));
    if(res.statusCode == 200){
      return jsonDecode(res.body);
    }
    throw Exception("Falha de conexão com a api $path/$id");
  }

}