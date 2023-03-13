import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:simple_animations/simple_animations.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignUpScreen());
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  Control control = Control.play;
  final controller = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                const Gap(30),
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      alignment: Alignment.centerLeft,
                      splashRadius: 15,
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    )),
                const Gap(30),
                const Text("Enter your details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                const Gap(30),
                CustomAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 300),
                  control: control, // bind state variable to parameter
                  tween: Tween(begin: -100.0, end: 0),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0, value),
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
                                prefixIcon: const Icon(CupertinoIcons.person),
                                contentPadding: const EdgeInsets.only(top: 15),
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                          child: TextField(
                            controller: controller.email,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                prefixIcon: const Icon(CupertinoIcons.mail),
                                contentPadding: const EdgeInsets.only(top: 15),
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                          child: TextField(
                            controller: controller.password,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                prefixIcon:
                                    const Icon(CupertinoIcons.lock_circle),
                                contentPadding: const EdgeInsets.only(top: 15),
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controller.confirmPassword,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm password",
                                prefixIcon:
                                    const Icon(CupertinoIcons.lock_circle),
                                contentPadding: const EdgeInsets.only(top: 15),
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(50),
                GestureDetector(
                  onTap: () => controller.register(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(colors: [
                          Color(0xFF4E65FF),
                          Color(0xFF5BBBE1),
                        ])),
                    child: const Center(
                      child: Text("Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ),
                ),
                const Gap(150),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(143, 148, 251, 1))),
                      TextSpan(
                        text: 'Login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.back();
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
}
