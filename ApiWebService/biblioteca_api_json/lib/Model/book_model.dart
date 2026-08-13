class Book{
  String? id;
  String? title;
  String? author;
  bool? isAvailable;

  Book({this.id, required this.title, required this.author, this.isAvailable = true});

  Map <String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'author': author,
      'isAvailable': isAvailable,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map){
    return Book(
      id: map["id"]. toString(),
      title: map ["title"].toString(),
      author: map ["author"].toString(),
      isAvailable: map ["isAvailable"] == true ? true : false
    );
  }
}