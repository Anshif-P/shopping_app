import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/controller/auth_bloc/authentication_bloc.dart';
import 'package:shopping_app/util/constance/text_style.dart';
import 'package:shopping_app/util/snack_bar/snack_bar.dart';
import 'package:shopping_app/util/validation/form_validation.dart';
import 'package:shopping_app/view/screen_parent.dart';
import 'package:shopping_app/view/screen_signup.dart';
import 'package:shopping_app/widget/comman/buttom_widget.dart';
import 'package:shopping_app/widget/comman/divider_widget.dart';
import 'package:shopping_app/widget/comman/text_feild_widget.dart';

// ignore: must_be_immutable
class ScreenLogIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool loadingCheck = false;

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
                    'Welcome To Shopfy',
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
                    validator: (value) => Validations.emailValidation(value),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldWidget(
                    isObscure: true,
                    textVisibility: true,
                    controller: passwordController,
                    hintText: 'Password',
                    icon: Icons.lock_open_outlined,
                    validator: (value) => Validations.emtyValidation(value),
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
                  BlocConsumer<AuthenticationBloc, AuthenticationState>(
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        loadingCheck = false;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ScreenParentNavigation()));
                      } else if (state is UserNotFountState) {
                        loadingCheck = false;
                        CustomSnackBar.showSnackBar(
                            context, 'No user Found with this Email');
                      } else if (state is WronPasswordState) {
                        loadingCheck = false;
                        CustomSnackBar.showSnackBar(
                            context, 'Password did not match');
                      } else if (state is UnknowErrorState) {
                        loadingCheck = false;
                        CustomSnackBar.showSnackBar(
                            context, 'Unkonwn error occur');
                      } else if (state is LoginLoadingState) {
                        loadingCheck = true;
                      }
                    },
                    builder: (context, state) => ButtonWidget(
                      colorCheck: true,
                      onpressFunction: () => logInFnc(context,
                          emailController.text, passwordController.text),
                      text: 'Sing in',
                      borderCheck: false,
                      loadingCheck: loadingCheck,
                    ),
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
                            builder: (context) => ScreenSignUp())),
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

  logInFnc(BuildContext context, String mail, String password) async {
    if (loginFormKey.currentState!.validate()) {
      loadingCheck = true;
      context
          .read<AuthenticationBloc>()
          .add(UserLoginEvent(email: mail, password: password));
    }
  }
}
