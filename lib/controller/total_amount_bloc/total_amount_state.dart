part of 'total_amount_bloc.dart';

abstract class TotalAmountState {}

final class TotalAmountInitial extends TotalAmountState {}

class CartedItemTotalAmountFetchedSuccessState extends TotalAmountState {
  double totalAmount;
  CartedItemTotalAmountFetchedSuccessState({required this.totalAmount});
}
