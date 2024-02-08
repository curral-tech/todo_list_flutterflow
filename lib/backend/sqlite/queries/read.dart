import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN LISTAPRODUTO
Future<List<ListaprodutoRow>> performListaproduto(
  Database database,
) {
  const query = '''
SELECT*FROM produto
''';
  return _readQuery(database, query, (d) => ListaprodutoRow(d));
}

class ListaprodutoRow extends SqliteRow {
  ListaprodutoRow(super.data);

  int get id => data['id'] as int;
  String get nome => data['nome'] as String;
  String get descricao => data['descricao'] as String;
  double get preco => data['preco'] as double;
}

/// END LISTAPRODUTO
