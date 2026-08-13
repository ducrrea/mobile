import 'package:biblioteca_api_json/Model/book_model.dart';
import 'package:biblioteca_api_json/Model/user_model.dart';

class Loan{
  Loan? loanId;
  Book bookId;
  User userId;
  bool? returned;
  DateTime? loanDate;


  Loan({this.loanId, required this.bookId, required this.userId, required this.returned, required this.loanDate});

  Map <String, dynamic> toMap(){
    return {
      'loanId': loanId,
      'bookId': bookId,
      'userId': userId,
      'returned': returned,
      'loanDate': loanDate?.toIso8601String(),
    };
  }

  factory Loan.fromMap(Map<String, dynamic> map){
    return Loan(
      loanId: map["loanId"],
      bookId: Book.fromMap(map["book"]),
      userId: User.fromMap(map["user"]),
      returned: map ["returned"] == true ? true : false,
      loanDate: DateTime.parse(map["loanDate"]),
    );
  }
}
