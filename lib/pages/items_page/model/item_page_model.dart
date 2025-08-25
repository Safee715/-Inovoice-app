final String tableName = 'Item';
final String columnId = 'Id';
final String columnItemName = 'ItemName';
final String columnItemPrice = 'ItemPrice';
final String columnItemCode = 'ItemCode';
final String columnItemQuantity = 'ItemQuantity';
final String columnItemCategory = 'ItemCategory';
final String columnItemUnit = 'ItemUnit';

class Item {
  int? id;
  String itemName;
  double itemPrice;
  double itemCode;
  int itemQuantity;
  String itemCategory;
  String itemUnit;
  Item({
    required this.itemName,
    this.id,
    required this.itemPrice,
    required this.itemCode,
    required this.itemQuantity,
    required this.itemCategory,
    required this.itemUnit,
  });

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnId: id,
      columnItemName: itemName,
      columnItemPrice: itemPrice,
      columnItemCode: itemCode,
      columnItemQuantity: itemQuantity,
      columnItemCategory: itemCategory,
      columnItemUnit: itemUnit,
    };
    return map;
  }

  Item.fromMap(Map<String, Object?> map)
    : id = map[columnId] as int?,
      itemName = map[columnItemName] as String,
      itemPrice = map[columnItemPrice] as double,
      itemCode = map[columnItemCode] as double,
      itemQuantity =
          (map[columnItemQuantity] as num)
              .toInt(),
      itemCategory =
          map[columnItemCategory] as String,
      itemUnit = map[columnItemUnit] as String;
}
