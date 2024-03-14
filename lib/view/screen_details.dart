import 'package:flutter/material.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/util/constance/colors.dart';

import '../widget/details_page_widget/price_add_cart_bt.dart';
import '../widget/details_page_widget/product_image.widget.dart';
import '../widget/details_page_widget/product_info_widget.dart';

class ScreenDetails extends StatelessWidget {
  final ProductModel data;
  const ScreenDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double notchHeight = MediaQuery.of(context).padding.top;
    double height = MediaQuery.sizeOf(context).height;
    double screenHeight = height - notchHeight;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: AddCartPriceWidget(data: data),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageWidget(
              data: data,
              screenHeight: screenHeight,
            ),
            Container(
                constraints: BoxConstraints(minHeight: screenHeight * 0.5 + 2),
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ProductInfoWidget(
                  data: data,
                )),
          ],
        ),
      )),
    );
  }
}
