import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:shopping_app/model/cart_model.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/network/local_data_base/local_storage.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddProductToCartEvent>(addProductToCartEvent);
    on<GetCartedProduct>(getCartedProduct);
  }

  FutureOr<void> addProductToCartEvent(
      AddProductToCartEvent event, Emitter<CartState> emit) async {
    CartItem cartItem = productToCartItem(event.data, event.quantity);
    await DatabaseHelper.instance.insertCartItem(cartItem);
    emit(ProductAddedToCartSuccessState());
  }

  FutureOr<void> getCartedProduct(
      GetCartedProduct event, Emitter<CartState> emit) async {
    List<CartItem> cartItem = await DatabaseHelper.instance.getAllCartItems();
    emit(CartFetchedSuccessState(productList: cartItem));
  }
}
