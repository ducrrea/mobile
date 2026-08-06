//Exemplo de uso do Convert Json

//importar a bilioteca 
import 'dart:convert';

void main(List<String> args) {
    String dbJson = '''{
        "id": 1,
        "nome": "João", 
        "login": "joao_user",
        "status": true,
        "senha": "1234",
        "endereco": {"Rua" : "A", "numero": 234},
        "emails": ["joao@gmail.com", "joao2@gmail.com"]
    }''';

    //converter o texto json => Map Dart
    Map<String, dynamic> usuario = json.decode(dbJson);
    print(usuario["nome"]);//printando informação da chave nome
    print(usuario["login"]);//printando informação da chave login


    //mudando um valor
    usuario["senha"]="1111";

    //converter o MAP em Texto Json usando encode
    String dbJson2 = json.encode(usuario);

    //printando o texto Json
    print(dbJson2);

}