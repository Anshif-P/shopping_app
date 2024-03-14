import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/controller/product_bloc/product_bloc.dart';
import 'package:shopping_app/util/constance/colors.dart';
import 'package:shopping_app/util/constance/text_style.dart';
import 'package:shopping_app/view/screen_home.dart';
import 'package:shopping_app/view/screen_login.dart';

import '../controller/cart_bloc/cart_bloc.dart';
import 'screen_parent.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    userLoginValidation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Frame 2 (1).png'))),
              ),
              Text(
                'Shopfy',
                style: AppText.largeDark,
              ),
            ],
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Transform.scale(
                scale: .9,
                child: const CircularProgressIndicator(
                    strokeWidth: 6, color: AppColor.grey),
              ),
            ),
          ],
        ))
      ]),
    );
  }

  userLoginValidation(BuildContext context) async {
    context.read<ProductBloc>().add(GetProducttsEvent());
    await Future.delayed(const Duration(seconds: 3));
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        context.read<CartBloc>().add(GetCartedProduct());
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => ScreenParentNavigation()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => ScreenLogIn()),
        );
      }
    });
  }
}
