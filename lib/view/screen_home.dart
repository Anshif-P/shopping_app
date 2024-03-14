import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/controller/product_bloc/product_bloc.dart';
import 'package:shopping_app/util/constance/colors.dart';
import 'package:shopping_app/util/constance/const_items.dart';
import 'package:shopping_app/util/constance/text_style.dart';
import 'package:shopping_app/view/screen_details.dart';
import 'package:shopping_app/view/screen_drawer.dart';
import 'package:shopping_app/widget/search_textfield_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: ScreenDrawer(),
      ),
      backgroundColor: AppColor.extraLightGrey,
      appBar: AppBar(
        backgroundColor: AppColor.extraLightGrey,
        leading: Builder(
          builder: (context) => InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: const Icon(
              Icons.menu,
              size: 30,
            ),
          ),
        ),
        actions: const [
          Icon(Icons.qr_code_scanner_outlined),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.shopping_bag_outlined),
          SizedBox(
            width: 10,
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SearchTextFieldWidget(),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Choose Brand',
              style: AppText.mediumdark,
            ),
          ),
          SizedBox(
            height: 160,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: ConstItems.products.length,
                itemBuilder: (context, index) {
                  final data = ConstItems.products[index];
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(children: [
                      Container(
                        height: 100,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                              image: AssetImage(data['image']),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Text(
                        data['name'],
                        style: AppText.mediumdark,
                      ),
                    ]),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Popular',
                  style: AppText.mediumdark,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
              if (state is ProductFetchSuccessState) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    final data = state.productList[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScreenDetails(data: data))),
                      child: Container(
                        height: 120,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Stack(
                                    children: [
                                      CachedNetworkImage(
                                        width: double.maxFinite,
                                        imageUrl: data.image,
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          baseColor: AppColor.extraLightGrey,
                                          highlightColor: Colors.white,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        data.image),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 5,
                                          right: 5,
                                          child: InkWell(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.shopping_bag,
                                              color: AppColor.primaryColor,
                                            ),
                                          ))
                                    ],
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          height: 15,
                                          child: Text(
                                            data.title,
                                            style: AppText.smallDark,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '₹ ${data.price.toString()}',
                                          style: AppText.mediumdark,
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return SizedBox();
            }),
          )
        ],
      )),
    );
  }
}
