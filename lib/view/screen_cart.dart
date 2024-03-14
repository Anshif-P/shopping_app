import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/controller/cart_bloc/cart_bloc.dart';
import '../model/product_model.dart';
import '../util/constance/text_style.dart';
import '../widget/cart_widget/checkout_button_widget.dart';
import '../widget/cart_widget/product_card_widget.dart';

// ignore: must_be_immutable
class ScreenCart extends StatelessWidget {
  final ProductModel? data;
  ValueNotifier<bool> cartItemCheck = ValueNotifier(false);
  ValueNotifier<int> quantity = ValueNotifier<int>(1);

  ScreenCart({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 1,
          elevation: 1,
          leading: const Icon(Icons.shopping_bag_outlined),
          centerTitle: true,
          title: Text(
            'Cart',
            style: AppText.mediumdark,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            )
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: cartItemCheck,
            builder: (context, value, child) =>
                value ? const CheckOutButtomWidget() : const SizedBox()),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartFetchedSuccessState &&
                        state.productList.isNotEmpty) {
                      cartItemCheck.value = true;
                      return ListView.separated(
                          itemCount: state.productList.length,
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemBuilder: (context, index) => ProductCartWidget(
                              data: state.productList[index],
                              index: index,
                              onPressed: (value) {
                                // Handle onPressed event here
                                print("Quantity changed to: $value");
                                // You can also update the quantityValue if needed
                                // quantityValue = value;
                              },
                              quantityValue: 1));
                    }
                    return Center(
                      child: Text(
                        'No Item Found',
                        style: AppText.smallDark,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
