import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DataBaseHelper{
  static Database _db;
  static String databaseName = 'Resturantdb.db';
  static String tableDatabase = "Create Table Resturant(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,"
      " name Text ,img Text, desprection Text , price Text)";
  static Future<Database> getDb() async {
    if(_db != null){
      return _db;
    }
    else{
      _db = await openDb();
      return _db;
    }
  }
  static Future<Database>openDb() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path,databaseName);
    var Resturantdb = await openDatabase(path,version: 1,onCreate: _FirstCreate);
    return Resturantdb;
  }
  static Future<Database> _FirstCreate(Database db , int version)async{
    var sql = tableDatabase;
    await db.execute(sql);

  }
  static Future<void> close() async {
    var db = await getDb();
    return db.close();
    _db = null;
  }

}