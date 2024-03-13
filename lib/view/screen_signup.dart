import 'package:flutter/material.dart';
import 'package:shopping_app/network/auth_fnc/firbase_auth.dart';
import 'package:shopping_app/util/constance/text_style.dart';
import 'package:shopping_app/util/validation/form_validation.dart';
import 'package:shopping_app/view/screen_login.dart';
import 'package:shopping_app/widget/buttom_widget.dart';
import 'package:shopping_app/widget/divider_widget.dart';
import 'package:shopping_app/widget/text_feild_widget.dart';

class ScreenSignUp extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conPasswordController = TextEditingController();

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  ScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: signUpFormKey,
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
                    'Sign Up',
                    style: AppText.largeDark,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Create a new account',
                    style: AppText.smallLight,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldWidget(
                    controller: userNameController,
                    hintText: 'Username',
                    icon: Icons.account_circle_outlined,
                    text: '',
                    validator: (value) => Validations.emtyValidation(value),
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
                    controller: passwordController,
                    hintText: 'Password',
                    icon: Icons.account_circle_outlined,
                    text: '',
                    validator: (value) => Validations.emtyValidation(value),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldWidget(
                    controller: conPasswordController,
                    hintText: 'Confirm Password',
                    icon: Icons.account_circle_outlined,
                    text: '',
                    validator: (value) => Validations.conformPasswordValidation(
                        value, passwordController.text),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtonWidget(
                    colorCheck: true,
                    onpressFunction: () => signUpFnc(
                        context,
                        emailController.text,
                        userNameController.text,
                        passwordController.text),
                    text: 'Sing Up',
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
                    onpressFunction: () => Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                            builder: (context) => ScreenLogIn())),
                    text: 'Sing in',
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

  signUpFnc(
      BuildContext context, String mail, String name, String password) async {
    if (signUpFormKey.currentState!.validate()) {
      AuthServices.signupUser(mail, password, name, context);
    }
  }
}
