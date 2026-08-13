class User{
  String? userId;
  String? name;
  String? email;
  



  User({this.userId, required this.name, required this.email}); //required é para fazer os campos serem obrigatórios

  Map <String, dynamic> toMap(){
    return {
      'userId': userId,
      'name': name,
      'email': email,
    };
  }

  //factory é um consrutor alternativo, que, explicando de forma simples, é um método que cria uma instância da classe a partir de um mapa (Map) de dados. Ele é usado para converter dados de um formato (como JSON ou Map) em um objeto da classe User. No caso do código fornecido, o factory User.fromMap pega um Map<String, dynamic> e cria uma instância da classe User com os valores correspondentes.
  factory User.fromMap(Map<String, dynamic> map){
    return User(
      userId: map["userId"]. toString(),
      name: map ["name"].toString(),
      email: map ["email"]. toString(), 
    );
  }
}
      
