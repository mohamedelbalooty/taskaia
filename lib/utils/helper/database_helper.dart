import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import '../../model/database_model.dart';
import '../constants.dart';

class DataBaseHelper {
  DataBaseHelper._();

  static final DataBaseHelper dbHelper = DataBaseHelper._();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  Future initDatabase() async {
    final String dbPath = await getDatabasesPath();
    final String dbName = path.join(dbPath, 'taskaia.db');
    return await openDatabase(
      dbName,
      version: 1,
      onCreate: (Database db, int version) async {
        await onCreateDatabase(db: db, version: version);
      },
    );
  }

  Future<void> onCreateDatabase(
      {required Database db, required int version}) async {
    await db.execute('''
          CREATE TABLE $taskTableKey(
          $taskIdKey INTEGER PRIMARY KEY AUTOINCREMENT,
          $taskTitleKey TEXT NOT NULL,
          $taskContentKey TEXT NOT NULL,
          $taskRepeatKey TEXT NOT NULL,
          $taskReminderKey INTEGER NOT NULL,
          $taskDatetimeKey TEXT NOT NULL,
          $taskStartTimeKey TEXT NOT NULL,
          $taskEndTimeKey TEXT NOT NULL,
          $taskIsCompletedKey INTEGER NOT NULL,
          $taskColorKey INTEGER NOT NULL)
          ''');
    await db.execute('''
          CREATE TABLE $noteTableKey(
          $noteIdKey INTEGER PRIMARY KEY AUTOINCREMENT,
          $noteTitleKey TEXT NOT NULL,
          $noteContentKey TEXT NOT NULL,
          $noteDatetimeKey TEXT NOT NULL,
          $noteImageKey TEXT NOT NULL,
          $noteColorKey INTEGER NOT NULL)
          ''');
    await db.execute('''
          CREATE TABLE $memoryTableKey(
          $memoryIdKey INTEGER PRIMARY KEY AUTOINCREMENT,
          $memoryTitleKey TEXT NOT NULL,
          $memoryContentKey TEXT NOT NULL,
          $memoryDatetimeKey TEXT NOT NULL,
          $memoryColorKey INTEGER NOT NULL)
          ''');
  }

  Future<void> insertOnDatabase(
      {required String table, required DatabaseModel databaseModel}) async {
    Database? dbClint = await database;
    await dbClint!.insert(
      table,
      databaseModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<Map<String, dynamic>>> getFromDatabase(
      {required String table}) async {
    Database? dbClint = await database;
    List<Map<String, dynamic>> jsonData = await dbClint!.query(table);
    return jsonData;
  }

  Future<void> updateOnDatabase(
      {required String table,
      required String tableId,
      required DatabaseModel databaseModel}) async {
    Database? dbClint = await database;
    await dbClint!.update(
      table,
      databaseModel.toJson(),
      where: '$tableId = ?',
      whereArgs: ['${databaseModel.id}'],
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<void> rowUpdateOnDatabase(
      {required String table, required String tableId, required int id}) async {
    Database? dbClint = await database;
    await dbClint!.rawUpdate('''
      UPDATE $table
      SET $taskIsCompletedKey = ?
      WHERE $tableId = ?
      ''', [1, id]);
  }

  Future<void> deleteFromDatabase(
      {required String table, required String tableId, required int id}) async {
    Database? dbClint = await database;
    await dbClint!.delete(
      table,
      where: '$tableId = ?',
      whereArgs: ['$id'],
    );
  }

  Future<void> closeDatabase() async {
    Database? dbClint = await database;
    await dbClint!.close();
  }
}
