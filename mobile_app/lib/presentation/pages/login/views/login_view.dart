import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gap/gap.dart';
import 'package:magic_sign/core/utils/colors.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:get/get.dart';

import '../../../../config/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  Control control = Control.play;
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
              height: Get.height * 0.25,
              child: CustomAnimationBuilder<double>(
                duration: const Duration(milliseconds: 300),
                control: control,
                tween: Tween(begin: -100.0, end: 100.0),
                builder: (context, value, child) {
                  return Transform.translate(
                    // animation that moves childs from left to right
                    offset: Offset(0, value),
                    child: child,
                  );
                },
                child: const Text(
                  'Welcome,\nSign up to continue!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                CustomAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 1000),
                  control: control, // bind state variable to parameter
                  tween: Tween(begin: -100.0, end: 0),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(value, 0),
                      child: child,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                          child: TextField(
                            controller: controller.userName,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Username",
                                prefixIcon: const Icon(CupertinoIcons.mail),
                                contentPadding: const EdgeInsets.only(top: 15),
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controller.password,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                prefixIcon: const Icon(CupertinoIcons.lock),
                                contentPadding: const EdgeInsets.only(top: 15),
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1)),
                        ))),
                const Gap(30),
                IntrinsicWidth(
                  child: Column(
                    children: [
                      _normalLoginButton(),
                      _loginMethodDivider(),
                      SignInButton(
                        Buttons.GoogleDark,
                        onPressed: () {
                          controller.signInWithGoogle();
                        },
                      ),
                    ],
                  ),
                ),
                const Gap(80),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(143, 148, 251, 1))),
                      TextSpan(
                        text: 'Sign up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.SIGN_UP);
                          },
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromRGBO(143, 148, 251, 1)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _normalLoginButton(){
    return InkWell(
      onTap: () async => await controller.login(),
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            gradient: const LinearGradient(colors: [
              Color(0xFF4E65FF),
              Color(0xFF5BBBE1),
            ])),
        child: const Center(
          child: Text("LOGIN",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ),
      ),
    );
  }

  Widget _loginMethodDivider(){
    return Row(
      children: const [
        Expanded(
          child: Divider(
            thickness: 2,
          )
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Text('OR',
          style: TextStyle(
           color: AppColor.black,
           fontWeight: FontWeight.bold
          )),
        ),
        Expanded(
            child: Divider(
              thickness: 2,
            )
        ),
      ],
    );
  }
}
