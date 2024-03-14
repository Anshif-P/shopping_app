import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/controller/total_amount_bloc/total_amount_bloc.dart';
import '../../util/constance/colors.dart';
import '../../util/constance/text_style.dart';

class CheckOutButtomWidget extends StatelessWidget {
  const CheckOutButtomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 144,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: AppText.mediumdark,
                          ),
                          BlocBuilder<TotalAmountBloc, TotalAmountState>(
                              builder: (context, state) {
                            if (state
                                is CartedItemTotalAmountFetchedSuccessState) {
                              return Text(
                                '₹${state.totalAmount.toStringAsFixed(2)}',
                                style: AppText.mediumdark,
                              );
                            }
                            return const SizedBox();
                          })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Saving Applied',
                            style: AppText.smallDark,
                          ),
                          Text(
                            '₹14.04',
                            style: AppText.smallDark,
                          )
                        ],
                      ),
                    ],
                  )),
              Expanded(
                  flex: 3,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          backgroundColor: const MaterialStatePropertyAll(
                              AppColor.primaryColor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Checkout',
                            style: AppText.standerdSizeWhite,
                          )
                        ],
                      ))),
            ],
          ),
        ));
  }
}
