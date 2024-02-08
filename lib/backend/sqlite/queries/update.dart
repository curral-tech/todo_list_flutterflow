import 'package:sqflite/sqflite.dart';

/// BEGIN ADDPRODUTO
Future performAddproduto(
  Database database, {
  String? nome,
  String? descricao,
  double? preco,
}) {
  final query = '''
INSERT INTO produto(nome,descricao,preco)VALUES('$nome','$descricao',$preco);
''';
  return database.rawQuery(query);
}

/// END ADDPRODUTO

/// BEGIN ATUALIZAPRODUTO
Future performAtualizaproduto(
  Database database, {
  int? id,
  String? nome,
  String? descricao,
  double? preco,
}) {
  final query = '''
UPDATE produto
SET
  nome = '$nome',
  descricao = '$descricao',
  preco = $preco
  WHERE ID =$id
 
''';
  return database.rawQuery(query);
}

/// END ATUALIZAPRODUTO

/// BEGIN DELETAPRODUTO
Future performDeletaproduto(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM produto WHERE ID = $id
''';
  return database.rawQuery(query);
}

/// END DELETAPRODUTO
