import 'package:DummyInvoice/pages/client_page/model/clients_page_model.dart';
import 'package:DummyInvoice/pages/items_page/model/item_page_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ClientsPageRepo {

  Future<Database> openDb() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'Item.db');
    return await openDatabase(
      path,
      version: 2,
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

        try {
          await db.execute('''
        create table Clients
        ($columnClientId integer primary key autoincrement,
        $columnFirstName text,
        $columnLastName text,
        $columnEmail text,
        $columnPhone text,
        $columnAddress text,
        ); 
        ''');
          print(
            "sql clients executed successfully",
          );
        } catch (e) {
          return print('$e');
        }
      },
      onUpgrade:
          (db, oldVersion, newVersion) async {
            if (oldVersion < 2) {
              await db.execute('''
        create table Clients
        ($columnClientId integer primary key autoincrement,
        $columnFirstName text,
        $columnLastName text,
        $columnEmail text,
        $columnPhone text,
        $columnAddress text
        ); 
        ''');
            }
          },
    );

  }
  Future<Database>get database async
  {
    Database db=await openDb();
    return db;
  }
  Future<Client>insertClient(Client client)async
  {
    final db=await database;
    await db.insert(clientTableName, client.toMap());
    return client;
  }

  Future<int>updateClient(Client client)async
  {final db=await openDb();
    return await db.update(clientTableName,
        client.toMap(),
        where: '$columnClientId=?'
        ,whereArgs: [client.id]);
  }
  Future<int>deleteClient(int id)async
  {
    final db=await openDb();
    return await db.delete(clientTableName,
        where: '$columnClientId=?',
        whereArgs: [id]
    );
  }
  Future<List<Client>>getAllClients()async
  {
    final db=await openDb();
   final  List<Map<String,dynamic>> clients=
    await db.query(clientTableName);
    return clients.map<Client>((e) => Client.fromMap(e)).toList();
  }

}
