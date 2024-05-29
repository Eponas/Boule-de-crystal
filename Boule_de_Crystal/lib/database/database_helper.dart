import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/zodiac_sign.dart';
import '../models/chinese_zodiac_sign.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'zodiac.db');
    try {
          await deleteDatabase(path);
    } catch (e) {
      
    }
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE zodiac_signs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        libelle TEXT,
        dateDebut TEXT,
        dateFin TEXT,
        description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE chinese_zodiac_signs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        year INTEGER,
        animal TEXT,
        description TEXT
      )
    ''');
  }

  Future<int> insertZodiacSign(ZodiacSign sign) async {
    Database db = await database;
    return await db.insert('zodiac_signs', sign.toMap());
  }

  Future<List<ZodiacSign>> getZodiacSigns() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('zodiac_signs');
    return List.generate(maps.length, (i) {
      return ZodiacSign.fromMap(maps[i]);
    });
  }

  Future<int> insertChineseZodiacSign(ChineseZodiacSign sign) async {
    Database db = await database;
    return await db.insert('chinese_zodiac_signs', sign.toMap());
  }

  Future<List<ChineseZodiacSign>> getChineseZodiacSigns() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('chinese_zodiac_signs');
    return List.generate(maps.length, (i) {
      return ChineseZodiacSign.fromMap(maps[i]);
    });
  }
}
