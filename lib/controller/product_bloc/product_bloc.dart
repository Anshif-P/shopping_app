import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/repositories/product_repo.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProducttsEvent>(getProducttsEvent);
  }

  FutureOr<void> getProducttsEvent(
      GetProducttsEvent event, Emitter<ProductState> emit) async {
    final either = await ProductRepo().getProducts();
    either.fold((error) => emit(ProductFetchErrorState(message: error.message)),
        (response) {
      List<ProductModel> productsList = [];
      List product = response;
      productsList = product.map((e) => ProductModel.fromJson(e)).toList();
      emit(ProductFetchSuccessState(productList: productsList));
    });
  }
}
