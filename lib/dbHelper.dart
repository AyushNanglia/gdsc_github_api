import 'dart:async';
import 'dart:io';

import 'package:gdsc_github_api/db_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class dbHelper{
  static String login;
  static int id;
  static const String databaseName="gdscUsers.db";


  dbHelper._();
  static final dbHelper db = dbHelper._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), databaseName),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
              '''CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, login CHAR[30]),
              nodeID CHAR[100],avatarURL CHAR[100], gravatar CHAR[100],apiURL CHAR[100],
              accUrl CHAR[100],followers CHAR[100],following CHAR[100],
              gists CHAR[100],starred CHAR[100],subscrips CHAR[100],orgs CHAR[100],
              repos CHAR[100],events CHAR[100],received_events CHAR[100],
              type CHAR[100],admin BIT''');
        });
  }


  /*save(dbHelper user)async{
    var db=await this.database;
    return await db.insert("users",user);
  }*/


}

