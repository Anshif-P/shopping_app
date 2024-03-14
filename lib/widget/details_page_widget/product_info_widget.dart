import 'package:flutter/material.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/util/constance/colors.dart';
import 'package:shopping_app/util/constance/text_style.dart';

import 'buttom_quantity.dart';
import 'star_widget.dart';

class ProductInfoWidget extends StatelessWidget {
  final ProductModel data;
  final List<String> productSize = ['S', 'M', 'L', 'XL', 'XXL'];
  ProductInfoWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Text(data.title, style: AppText.standerdSize),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
                QuantityButtonWidget(),
              ],
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            data.category,
            style: AppText.smallDark,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    const StarWidget(),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '(320 Review)',
                      style: AppText.smallDark,
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Text(
                    'Available in stock',
                    textAlign: TextAlign.end,
                    style: AppText.smallDark,
                  ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Size',
                      style: AppText.standerdSize,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => Container(
                          height: 18,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(color: AppColor.grey)),
                          child: Text(
                            productSize[index],
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.separated(
                          itemBuilder: (context, index) => CircleAvatar(
                              radius: 10,
                              backgroundColor: AppColor.customColorsList[index],
                              child: index == 0
                                  ? const Icon(
                                      Icons.done,
                                      size: 15,
                                    )
                                  : const SizedBox()),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 5,
                              ),
                          itemCount: 4),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Description',
            style: AppText.standerdSize,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(data.description),
        ],
      ),
    );
  }
}
