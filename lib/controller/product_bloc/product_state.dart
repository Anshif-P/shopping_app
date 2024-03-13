part of 'product_bloc.dart';

abstract class ProductState {}

final class ProductInitial extends ProductState {}

class ProductFetchSuccessState extends ProductState {
  List<ProductModel> productList;
  ProductFetchSuccessState({required this.productList});
}

class ProductFetchErrorState extends ProductState {
  String message;
  ProductFetchErrorState({required this.message});
}
