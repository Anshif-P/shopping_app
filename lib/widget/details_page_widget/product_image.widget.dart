import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/util/constance/colors.dart';

class ProductImageWidget extends StatelessWidget {
  final ProductModel data;
  final double screenHeight;
  const ProductImageWidget(
      {super.key, required this.data, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          height: screenHeight * 0.4,
          width: double.maxFinite,
          imageUrl: data.image,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: AppColor.grey,
            highlightColor: AppColor.lightGreyColor,
            child: Container(
              constraints: const BoxConstraints(minHeight: 160),
              height: screenHeight * 0.4,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(data.image), fit: BoxFit.cover)),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                  radius: 16,
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  child: Icon(
                    Icons.volume_down,
                    color: Colors.white,
                  )),
              CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColor.backgroundColor,
                  child: Icon(Icons.shopping_bag_outlined))
            ],
          ),
        )
      ],
    );
  }
}
