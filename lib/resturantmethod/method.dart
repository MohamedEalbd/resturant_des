
import 'package:resturant_des/database_helper/database.dart';
import 'package:resturant_des/model/resturant.dart';
import 'package:sqflite/sqlite_api.dart';
class ResturantMethod {
  static Future<int> AddFood(Resturant resturant) async{
    Database myDatabase = await DataBaseHelper.getDb();
    myDatabase.insert("Resturant", resturant.toMap());
  }
  static Future<List> GetAllFood() async {
    Database myDatabase = await DataBaseHelper.getDb();
    String sql = "Select * From Resturant";
   List result = await myDatabase.rawQuery(sql);
   return result.toList();
  }
  static Future<int> deleteFood(int id) async {
    Database myDatabase = await DataBaseHelper.getDb();
    int result = await myDatabase.delete("Resturant",where: "id = ${id}");
    return result;
  }
  static Future<int> EditFood(Resturant oldFoodObj) async {
    Database myDatabase = await DataBaseHelper.getDb();
    int result = await myDatabase.update("Resturant", oldFoodObj.toMap(),where: "id = ${oldFoodObj.id}");
    print(result);
    return result;
  }
  static Future<Resturant> getBuyFood() async {
    Database myDatabase = await DataBaseHelper.getDb();
   List<Map> result =await myDatabase.query(
       "Resturant",
       columns:["name" , "img" , " price"] ,
       where: "id = ? " , whereArgs: ["id"]  );
   if(result.length > 0){
     return Resturant.fromMap(result.first);
   }
   return null;


  }
}