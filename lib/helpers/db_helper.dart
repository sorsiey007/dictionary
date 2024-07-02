import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  String databaseName = 'khmer_khmer.db';
  Database? database;

  DBHelper() {
    initDB();
  }

  initDB() async {
    // Get a location using getDatabasesPath
    var documentsDirectory = await getDatabasesPath();
    String path = documentsDirectory + '/' + databaseName;
    if (await File(path).exists()) {
    } else {
      ByteData data = await rootBundle.load("assets/" + databaseName);
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }

    database = await openDatabase(
      path,
      version: 1,
    );
  }

  Future<List<Map<String, Object?>>> select(String q) {
    return database!.rawQuery(q);
  }
}
