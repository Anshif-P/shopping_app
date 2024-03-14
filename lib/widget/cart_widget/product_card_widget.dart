import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/model/cart_model.dart';
import 'package:shopping_app/util/constance/colors.dart';
import '../../util/constance/text_style.dart';
import 'quantity_counter.dart';

class ProductCartWidget extends StatelessWidget {
  final CartItem data;
  final int index;

  final Function(int) onPressed;
  final int quantityValue;
  const ProductCartWidget(
      {super.key,
      required this.data,
      required this.index,
      required this.onPressed,
      required this.quantityValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: AppColor.extraLightGrey,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: CachedNetworkImage(
                  imageUrl: data.productImage,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColor.grey,
                    highlightColor: AppColor.extraLightGrey,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(data.productImage),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              data.productName.length <= 20
                                  ? data.productName
                                  : '${data.productName.substring(0, 20)}..',
                              style: AppText.standerdSize,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                alignment: Alignment.topRight,
                                child: const Icon(Icons.close)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text('Color: '),
                        CircleAvatar(
                          radius: 9,
                          backgroundColor: AppColor.customColorsList[index % 5],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Size:  XS'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '₹1099.00',
                                style: AppText.toSmallLineThrough,
                              ),
                              Text(
                                '₹${data.price}',
                                style: AppText.standerdSize,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: QuantityCounterWidget(
                          onPressed: onPressed,
                          quantityValue: quantityValue,
                        )),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
