import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:shopping_app/network/local_data_base/local_storage.dart';
part 'total_amount_event.dart';
part 'total_amount_state.dart';

class TotalAmountBloc extends Bloc<TotalAmountEvent, TotalAmountState> {
  TotalAmountBloc() : super(TotalAmountInitial()) {
    on<GetCartItemsTotolAmount>(getCartItemsTotolAmount);
  }

  FutureOr<void> getCartItemsTotolAmount(
      GetCartItemsTotolAmount event, Emitter<TotalAmountState> emit) async {
    double totalAmount = await DatabaseHelper.instance.getTotalCartAmount();
    emit(CartedItemTotalAmountFetchedSuccessState(totalAmount: totalAmount));
  }
}
