import 'package:flutter/material.dart';
import 'package:shopping_app/util/constance/colors.dart';
import 'package:shopping_app/util/constance/text_style.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          color: AppColor.lightGreyColor,
          height: 1,
        )),
        const SizedBox(
          width: 5,
        ),
        Text('Or', style: AppText.smallGrey),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            color: AppColor.lightGreyColor,
            height: 1,
          ),
        ),
        // Divider(
        //   color: Color(0xFFDADADA),
        //   height: 25,
        //   thickness: 1,
        //   indent: 5,
        //   endIndent: 5,
        // ),
      ],
    );
  }
}
