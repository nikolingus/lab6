import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const String _databaseName = 'app_database.db';
  static const int _databaseVersion = 2;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE currencies(
        id TEXT PRIMARY KEY,
        nominal INTEGER,
        name TEXT,
        symbol TEXT,
        value REAL,
        previous_value REAL,
        is_favorite INTEGER DEFAULT 0,
        updated_at INTEGER
      )
    ''');
    await db.execute('DROP TABLE IF EXISTS news');
    await db.execute('''
      CREATE TABLE news(
        link TEXT PRIMARY KEY,
        title TEXT,
        date INTEGER,
        category TEXT,
        updated_at INTEGER
      )
    ''');
  }

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}