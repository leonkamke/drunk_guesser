import 'dart:typed_data';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import '../models/category.dart';
import '../models/category_data.dart';
import '../models/question.dart';

class DrunkGuesserDB {
  static const String dbName = "drunk_guesser_db.db";
  static late Database db;

  static Future<void> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);
    var localVersion = 2;
    var assetVersion = 2;

    // Check if the database exists
    var exists = await databaseExists(path);
    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e.toString());
      }

      // Copy from asset
      ByteData data = await rootBundle.load(join("database", dbName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else if (exists && localVersion < assetVersion) {
      // app was updated
      print(
          "copy old information into new database and then replace the db on the divice");
    } else {
      print("Opening existing database");
    }

    // open the database
    db = await openDatabase(path);
  }

  /*
  var queryMap =
    await db.rawQuery("SELECT * FROM Frage ORDER BY RANDOM() LIMIT 1");
    // Returns a list of maps
    // Every map has the column names as its keys and the column entries as its values

    var result = List.of(queryMap);
    // result.shuffle();

    print(result);

    // _text = result[0]["frage"] as String;
    // notifyListeners();
   */

  /*
  Lookup in the local database whether the Category category is purchased
   */
  static Future<bool> categoryPurchased(Category category) async {
    await initDatabase();
    // var x = await db.rawQuery("SELECT ${category.name} FROM Purchased");
    var output = await db.rawQuery("SELECT ${category.dbName} FROM Purchased");
    print(output);
    // db.close();
    bool purchased = false;
    if (output[0][category.dbName.toString()] == 1) {
      purchased = true;
    }
    return purchased;
  }

  static void deleteDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);
    await deleteDatabase(path);
  }

  static Future<void> purchaseCategory(Category category) async {
    await initDatabase();
    await db.rawQuery("UPDATE Purchased SET ${category.dbName} = 1");
    Categories.categoryList
        .where((element) => element.name == category.name)
        .first
        .purchased = true;
  }

  static Future<int> getLocalVersion() async {
    await initDatabase();
    return await db.getVersion();
  }

  static Future<void> markAsRead(String dbName, int id) async {
    await initDatabase();
    await db.rawQuery("UPDATE $dbName SET gelesen=1 WHERE id == $id");
  }

  static Future<Question> getQuestion(List<Category> selectedCategories) async {
    await initDatabase();
    var rand = Random();
    int index = rand.nextInt(selectedCategories.length);
    var q = await db.rawQuery(
        "SELECT * FROM ${selectedCategories[index].dbName} WHERE gelesen == 0 ORDER BY RANDOM() LIMIT 1");

    if (q.isEmpty) {
      // All questions are already read (gelesen == 1 for every question)
      // Set gelesen of all questions from 1 to 0 again
      await db
          .rawQuery("UPDATE ${selectedCategories[index].dbName} SET gelesen=0");
      // Repeat query
      q = await db.rawQuery(
          "SELECT * FROM ${selectedCategories[index].dbName} WHERE gelesen == 0 ORDER BY RANDOM() LIMIT 1");
      print("set gelesen back to 0");
    }

    return Question(
      question: q.first["frage"] as String,
      answer: q.first["antwort"] as String,
      category: selectedCategories[index],
      id: q.first["id"] as int,
    );
  }

  static Future<List<Question>> getQuestions(
      List<Category> selectedCategories) async {
    List<Question> questions = [];
    await initDatabase();
    // One game contains 18 questions
    var rand = Random();
    List<String> conditionString = [];
    for (int i = 0; i < selectedCategories.length; i++) {
      conditionString.add("");
    }
    for (int i = 0; i < 18; i++) {
      int index = rand.nextInt(selectedCategories.length);
      var q = await db.rawQuery(
          "SELECT * FROM ${selectedCategories[index].dbName} WHERE gelesen == 0 ${conditionString[index]}ORDER BY RANDOM() LIMIT 1");

      if (q.isEmpty) {
        // All questions are already read
        // Set gelesen of all questions from 1 to 0 again
        await db.rawQuery(
            "UPDATE ${selectedCategories[index].dbName} SET gelesen=0");
        // Repeat query
        q = await db.rawQuery(
            "SELECT * FROM ${selectedCategories[index].dbName} WHERE gelesen == 0 ORDER BY RANDOM() LIMIT 1");
        print("set gelesen back to 0");
      }

      // Store in conditionString the ID of question q
      conditionString[index] += "AND id != ${q.first["id"] as int} ";

      questions.add(
        Question(
          question: q.first["frage"] as String,
          answer: q.first["antwort"] as String,
          category: selectedCategories[index],
          id: q.first["id"] as int,
        ),
      );
    }
    return questions;
  }
}
