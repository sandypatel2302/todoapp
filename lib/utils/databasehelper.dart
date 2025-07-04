import 'package:sqflite/sqflite.dart';
import 'package:todoapp/models/taskmodel.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    final dbPath = await getDatabasesPath();
    final path = '$dbPath/task.db';

    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    return _database!;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE task (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      priority TEXT,
      category TEXT,
      time INTEGER
    )
    ''');
  }

  Future<void> insertItem(TaskModel item) async {
    final db = await instance.database;
    await db.insert(
      'task',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TaskModel>> getTaskItems() async {
    final db = await instance.database;
    final result = await db.query('task');
    return result.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future<void> saveTask(
    String title,
    String priority,
    String category,
    int time,
  ) async {
    final db = await instance.database;

    await db.insert('task', {
      'title': title,
      'priority': priority,
      'category': category,
      'time': time,
    });
  }
}
