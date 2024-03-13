import 'package:flutter/material.dart';
import 'package:shopping_app/util/constance/text_style.dart';
import 'package:shopping_app/util/validation/form_validation.dart';
import 'package:shopping_app/widget/buttom_widget.dart';
import 'package:shopping_app/widget/divider_widget.dart';
import 'package:shopping_app/widget/text_feild_widget.dart';

class ScreenLogIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  ScreenLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: loginFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Frame 2 (1).png'))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome To Shopyfy',
                    style: AppText.largeDark,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign in to Continue',
                    style: AppText.smallLight,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldWidget(
                    controller: emailController,
                    hintText: 'Email',
                    icon: Icons.account_circle_outlined,
                    text: '',
                    validator: (value) => Validations.emailValidation(value),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldWidget(
                    controller: emailController,
                    hintText: 'Password',
                    icon: Icons.account_circle_outlined,
                    text: '',
                    validator: (value) => Validations.emailValidation(value),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password?',
                        style: AppText.smallDark,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: false,
                          onChanged: (value) {}),
                      Text(
                        'Remeber me and keep me logged in',
                        style: AppText.smallGrey,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonWidget(
                    colorCheck: true,
                    onpressFunction: () => logInFnc,
                    text: 'Sing in',
                    borderCheck: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const DividerWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    loadingCheck: false,
                    colorCheck: false,
                    onpressFunction: () => logInFnc,
                    text: 'Sing Up',
                    borderCheck: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  logInFnc(BuildContext context) {
    if (loginFormKey.currentState!.validate()) {}
  }
}
