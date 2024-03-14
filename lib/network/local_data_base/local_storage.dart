import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../model/cart_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    return await openDatabase(
      join(path, 'cart_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cart(id INTEGER PRIMARY KEY AUTOINCREMENT, productId INTEGER, productName TEXT, productImage TEXT, price REAL, quantity INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<int> insertCartItem(CartItem cartItem) async {
    final db = await database;

    final List<Map<String, dynamic>> existingProducts = await db.query(
      'cart',
      where: 'productId = ?',
      whereArgs: [cartItem.productId],
    );

    if (existingProducts.isNotEmpty) {
      final int existingQuantity = existingProducts.first['quantity'];
      final int newQuantity = cartItem.quantity + existingQuantity;
      return await db.update(
        'cart',
        {'quantity': newQuantity},
        where: 'productId = ?',
        whereArgs: [cartItem.productId],
      );
    } else {
      return await db.insert('cart', cartItem.toMap());
    }
  }

  Future<List<CartItem>> getAllCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cart');
    return List.generate(maps.length, (i) {
      return CartItem(
        id: maps[i]['id'],
        productId: maps[i]['productId'],
        productName: maps[i]['productName'],
        productImage: maps[i]['productImage'],
        price: maps[i]['price'],
        quantity: maps[i]['quantity'],
      );
    });
  }

  Future<int> updateCartItemQuantity(CartItem cartItem) async {
    final db = await database;
    return await db.update(
      'cart',
      cartItem.toMap(),
      where: 'id = ?',
      whereArgs: [cartItem.id],
    );
  }

  Future<double> getTotalCartAmount() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT SUM(price * quantity) AS total FROM cart',
    );
    final totalAmount = result.first['total'] ?? 0;
    return totalAmount.toDouble();
  }
}
