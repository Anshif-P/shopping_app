// import 'package:flutter/material.dart';
// import 'package:shopping_app/util/constance/colors.dart';

// class QuantityCounterWidget extends StatelessWidget {
//   final ValueNotifier<int> quantity;
//   final int index;

//  const  QuantityCounterWidget({
//     super.key,
//     required this.quantity,
//     required this.index
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 35,
//       width: 60,
//       decoration: BoxDecoration(
//           border: Border.all(color: AppColor.grey, width: 1),
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           InkWell(
//             onTap: () {
//               if (quantity.value > 1) {
//                 quantity.value--;

//               }
//             },
//             child: Container(
//               color: Colors.black,
//               height: 1,
//               width: 7,
//             ),
//           ),
//           ValueListenableBuilder<int>(
//             valueListenable: quantity,
//             builder: (context, value, child) => Text(value.toString()),
//           ),
//           InkWell(
//             onTap: () {
//               quantity.value++;
//             },
//             child: const Text('+'),
//           ),
//         ],
//       ),
//     );
//   }
// }

//--------------------///

import 'package:flutter/material.dart';

class QuantityCounterWidget extends StatelessWidget {
  final ValueNotifier<int> quantity = ValueNotifier<int>(1);

  QuantityCounterWidget({
    super.key,
    required this.onPressed,
    required this.quantityValue,
  });
  final Function(int) onPressed;
  final int quantityValue;

  @override
  Widget build(BuildContext context) {
    quantity.value = quantityValue;
    return Container(
      height: 35,
      width: 60,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              if (quantity.value > 1) {
                quantity.value--;
                onPressed(quantity.value);
              }
            },
            child: Container(
              color: Colors.black,
              height: 1,
              width: 7,
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: quantity,
            builder: (context, value, child) => Text(value.toString()),
          ),
          InkWell(
            onTap: () {
              quantity.value++;
              onPressed(quantity.value);
            },
            child: const Text('+'),
          ),
        ],
      ),
    );
  }
}
