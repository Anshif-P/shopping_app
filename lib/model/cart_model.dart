import 'package:shopping_app/model/product_model.dart';

class CartItem {
  final int id;
  final int productId;
  final String productName;
  final String productImage;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.quantity,
  });
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'price': price,
      'quantity': quantity,
    };
  }
}

CartItem productToCartItem(ProductModel product, int quantity) {
  return CartItem(
    id: 0, // Set to 0 as it's usually auto incremented in the database
    productId: product.id,
    productName: product.title,
    productImage: product.image,
    price: product.price,
    quantity: quantity,
  );
}
