import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/controller/cart_bloc/cart_bloc.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/util/constance/colors.dart';
import 'package:shopping_app/util/constance/text_style.dart';

class AddCartPriceWidget extends StatelessWidget {
  final ProductModel data;
  const AddCartPriceWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.backgroundColor,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(children: [
          Expanded(
              child: SizedBox(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Price',
                    style: AppText.smallDark,
                  ),
                  Text(
                    '₹${data.price}',
                    style: AppText.standerdSize,
                  )
                ]),
          )),
          Expanded(
              child: SizedBox(
            height: 80,
            width: double.maxFinite,
            child: ElevatedButton(
                onPressed: () {
                  context
                      .read<CartBloc>()
                      .add(AddProductToCartEvent(data: data, quantity: 0));
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Product added to cart')));
                  context.read<CartBloc>().add(GetCartedProduct());
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      'Add to cart',
                      style: AppText.standerdSizeWhite,
                    )
                  ],
                )),
          ))
        ]),
      ),
    );
  }
}
