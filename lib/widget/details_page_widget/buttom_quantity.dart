import 'package:flutter/material.dart';
import 'package:shopping_app/util/constance/colors.dart';

class QuantityButtonWidget extends StatelessWidget {
  final bool styleCheck;

  const QuantityButtonWidget({
    super.key,
    this.styleCheck = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: styleCheck ? 35 : 25,
      width: 60,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.grey, width: 1),
          color: styleCheck ? Colors.white : Colors.white,
          borderRadius: styleCheck
              ? BorderRadius.circular(10)
              : BorderRadius.circular(30)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          color: styleCheck ? Colors.black : Colors.black,
          height: 1,
          width: 7,
        ),
        const Text('1'),
        const Text('+')
      ]),
    );
  }
}
