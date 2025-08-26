import 'package:DummyInvoice/pages/items_page/model/item_page_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ItemPageRepository {
  static Database? db;

  Future<Database> openDb() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'Item.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        try {
          await db.execute('''
      create table Item
      ($columnId Integer primary key autoincrement,
      $columnItemName Text ,
      $columnItemPrice Real ,
      $columnItemCode  Real,
      $columnItemQuantity  real,
      $columnItemCategory Text,
      $columnItemUnit Text
      );
  
      ''');

          print('sql executed successfully');
        } catch (e) {
          return print('$e');
        }
      },
    );
  }

  Future<Database> get database async {
    if (db != null) return db!;
    db = await openDb();
    return db!;
  }

  Future<Item> insertItem(Item item) async {
    final dbClient = await database;
    item.id = await dbClient.insert(
      tableName,
      item.toMap(),
    );
    return item;
  }

  Future<int> upDateItem(Item item) async {
    final dbClient = await database;

    return await dbClient.update(
      tableName,
      item.toMap(),
      where: '$columnId=?',
      whereArgs: [item.id],
    );
  }



  Future<int> deleteItem(int id) async {
    final dbClient = await database;

    return dbClient.delete(
      tableName,
      where: '$columnId=?',
      whereArgs: [id],
    );
  }

  Future<List<Item>> getAllItems() async {
    final dbClient = await database;
    List<Map<String, Object?>> items =
        await dbClient.query(tableName);
    return items
        .map((e) => Item.fromMap(e))
        .toList();
  }
}
