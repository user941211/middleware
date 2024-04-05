import 'package:sqlite3/sqlite3.dart';

class DatabaseHelper {
  final db = sqlite3.open('example.db');

  bool verifyUser(String account, String passwd) {
    final stmt = db.prepare('SELECT * FROM tb_users WHERE account = ? AND passwd = ?');
    final result = stmt.select([account, passwd]);
    final userExists = result.isNotEmpty;
    stmt.dispose();
    return userExists;
  }
}
