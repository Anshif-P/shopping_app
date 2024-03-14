part of 'cart_bloc.dart';

abstract class CartState {}

final class CartInitial extends CartState {}

class ProductAddedToCartSuccessState extends CartState {}

class CartFetchedSuccessState extends CartState {
  List<CartItem> productList;

  CartFetchedSuccessState({required this.productList});
}

class UpdateQuantitySuccessState extends CartState {}
