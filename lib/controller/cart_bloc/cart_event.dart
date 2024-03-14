part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddProductToCartEvent extends CartEvent {
  ProductModel data;
  int quantity;
  AddProductToCartEvent({required this.data, required this.quantity});
}

class GetCartedProduct extends CartEvent {}

class UpdateQuantityEvent extends CartEvent {
  CartItem cartItemModel;
  UpdateQuantityEvent({required this.cartItemModel});
}
