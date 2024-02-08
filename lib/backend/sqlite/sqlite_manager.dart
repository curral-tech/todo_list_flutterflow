import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'sqlitecadastro',
      'produto_test.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<ListaprodutoRow>> listaproduto() => performListaproduto(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future addproduto({
    String? nome,
    String? descricao,
    double? preco,
  }) =>
      performAddproduto(
        _database,
        nome: nome,
        descricao: descricao,
        preco: preco,
      );

  Future atualizaproduto({
    int? id,
    String? nome,
    String? descricao,
    double? preco,
  }) =>
      performAtualizaproduto(
        _database,
        id: id,
        nome: nome,
        descricao: descricao,
        preco: preco,
      );

  Future deletaproduto({
    int? id,
  }) =>
      performDeletaproduto(
        _database,
        id: id,
      );

  /// END UPDATE QUERY CALLS
}
