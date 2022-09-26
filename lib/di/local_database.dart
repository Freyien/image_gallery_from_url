import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataBase {
  static Future<Database> init() async {
    return openDatabase(
      join(await getDatabasesPath(), 'image_gallery.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE images(uuid STRING PRIMARY KEY, path STRING)',
        );

        await db.execute(
          'CREATE TABLE session(is_logged BOOL)',
        );
      },
      version: 1,
    );
  }
}
