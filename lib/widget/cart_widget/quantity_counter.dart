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
      child: Row(children: [
        Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                if (quantity.value > 1) {
                  quantity.value--;
                  onPressed(quantity.value);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.black,
                    height: 1,
                    width: 7,
                  ),
                ],
              ),
            )),
        Expanded(
            flex: 1,
            child: ValueListenableBuilder(
              valueListenable: quantity,
              builder: (context, value, child) => Text(
                value.toString(),
                textAlign: TextAlign.center,
              ),
            )),
        Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                quantity.value++;
                onPressed(quantity.value);
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '+',
                  ),
                ],
              ),
            )),
      ]),
    );
  }
}


// Container(
//       height: 35,
//       width: 60,
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey, width: 1),
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           InkWell(
//             onTap: () {
//               if (quantity.value > 1) {
//                 quantity.value--;
//                 onPressed(quantity.value);
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
//               onPressed(quantity.value);
//             },
//             child: const Text('+'),
//           ),
//         ],
//       ),
//     );