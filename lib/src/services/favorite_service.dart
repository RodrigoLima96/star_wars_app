import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class FavoriteService {
  FavoriteService._();

  static final FavoriteService instance = FavoriteService._();

  static Database? _dataBase;

  get database async {
    if (_dataBase != null) return _dataBase;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      path.join(await getDatabasesPath(), 'crypto.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_favorites);
  }

  String get _favorites => '''
    CREATE TABLE favorites (
      id TEXT PRIMARY KEY,
      type TEXT,
      name TEXT
    );
  ''';
}
