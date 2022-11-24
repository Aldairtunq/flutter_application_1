import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase;

  static final DBAdmin db = DBAdmin._();
  DBAdmin._();

  Future<Database?> chekDatabase() async {
    if (myDatabase != null) {
      return myDatabase;
    }

    myDatabase = await initDatabase();
    return myDatabase;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "TaskDB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database dbx, int version) async {
        await dbx.execute(
            "CREATE TABLE task(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, status TEXT)");
      },
    );
  }

  insertTask() async {
    Database? db = await chekDatabase();
    int res = await db!.rawInsert(
        "INSERT INTO TASK (title, description, status) VALUES {'ir de compras','tenemos que ir ttotus','false'} ");
    print(res);
  }

  getRawTasks() async {
    Database? db = await chekDatabase();
    List tasks = await db!.rawQuery("SEELCT * FROM  task ");
    print(tasks[0]);
  }

//devolver la lista demapas

  Future<List<Map<String, dynamic>>> getTasks() async {
    Database? db = await chekDatabase();
    List<Map<String, dynamic>> tasks = await db!.query("Tasks ");
    print("www $tasks ");
    return tasks;
  }

  updateRawTask() async {
    Database? db = await chekDatabase();
    int res = await db!.rawUpdate(
        "UPDATE TASK SET title =  ' ir de comrpa',description= 'comprar ' status='true' WHERE id=1");
    print(res);
  }

  updateTask() async {
    Database? db = await chekDatabase();
    int res = await db!.update(
      "TASK",
      {
        "title": " ir al cine",
        "description": " es el viernes en la tatrea",
        "title": "false",
      },
      where: "id =2",
    );
  }

  deleteRawTask() async {
    Database? db = await chekDatabase();
    int res = await db!.rawDelete("DELETE FROM TASK WHERE id=1");
    print(res);
  }

  deleteTask() async {
    Database? db = await chekDatabase();
    int res = await db!.delete("TASK", where: "id=3");
    print(res);
  }
}
