import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import '../models/category.dart';
import '../models/category_data.dart';

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
}
