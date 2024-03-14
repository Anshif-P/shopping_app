import 'package:flutter/material.dart';

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
                          Text(
                            '₹119.00',
                            style: AppText.mediumdark,
                          )
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
                          backgroundColor:
                              MaterialStatePropertyAll(AppColor.primaryColor)),
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
