import 'category.dart';

class Question {
  String question;
  String answer;
  String categoryDBName;
  int id;

  Question({
    required this.question,
    required this.answer,
    required this.categoryDBName,
    required this.id,
  });

}
