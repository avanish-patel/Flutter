import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:notekepper/model/note.dart';

class DatabaseHelper {

  // singleton database helper
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDate = 'date';


  DatabaseHelper._createInstance();

  factory DatabaseHelper(){

    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if(_database == null ) {
      _database = await initializeDatabase();

    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // get directory for storing database in Android and iOS
    Directory directory =await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // open/create the database at given path
    var noteDB = await openDatabase(path, version: 1, onCreate: _createDB);

    return noteDB;
  }

   void _createDB(Database db, int newVersion) async{

    String sql = 'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT, $colDescription TEXT, $colDate TEXT)';

    await db.execute(sql);
  }

  // Fetch operation : get all notes
  Future<List<Map<String,dynamic>>> getNoteMapList() async {

    Database db = await this.database;

    //var result = await db.rawQuery('SELECT * FROM $noteTable');
    var result = await db.query(noteTable);
    return result;
  }

  // Insert Operation
  Future<int> insertNote(Note note) async{

    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  // Update Operation
  Future<int> updateNote(Note note) async{
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);

    return result;
  }

  // Delete operation
  Future<int> deleteNote(int id) async {

    Database db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');

    return result;
  }

  // Get the number of object in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String,dynamic>> x = await db.rawQuery('SELECT COUNT (*) FROM $noteTable');
    int result = Sqflite.firstIntValue(x);

  }

  // get the map from db and convert into notelist list
  Future<List<Note>> getNoteList() async {

    var noteMapList = await getNoteMapList();
    int count = noteMapList.length;

    List<Note> noteList = List<Note>();
    for(int i=0; i< count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }

}