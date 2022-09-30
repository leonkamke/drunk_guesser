import 'category.dart';

class Question {
  String question;
  String answer;
  Category category;
  int id;

  Question({
    required this.question,
    required this.answer,
    required this.category,
    required this.id,
  });

}
