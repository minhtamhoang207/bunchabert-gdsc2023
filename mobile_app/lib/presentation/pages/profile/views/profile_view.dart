import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:magic_sign/data/data_source/local/local_storage.dart';
import 'package:text_selection_controls/text_selection_controls.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../config/routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                  radius: (52),
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      controller.currentUser?.photoUrl ??
                          'https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            const Gap(15),
            Center(
              child: Text(controller.currentUser?.displayName ?? '',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black)),
            ),
            const Gap(50),
            _information(
                title: 'Name',
                content: controller.currentUser?.displayName ?? '',
                icon: Icons.person),
            _information(
                title: 'Email',
                content: controller.currentUser?.email ?? '',
                icon: Icons.mail),
            // _information(title: 'Password', content: 'Hoang Minh Tam', icon: Icons.lock),
            // _information(title: 'Phone number', content: 'Hoang Minh Tam', icon: Icons.phone_android),
            _information(
                title: 'Privacy policy',
                content: 'Magic Sign policy',
                icon: Icons.privacy_tip_rounded,
                edit: false),
            const Gap(50),
            logoutButton(controller),
            const Gap(50),
          ],
        ),
      ),
    );
  }
}

Widget _information(
    {required String title,
    required String content,
    required IconData icon,
    bool edit = true}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(icon, color: const Color(0xFF4C6ED7)),
              ),
              const Gap(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black)),
                  const Gap(8),
                  Text(content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black54)),
                ],
              )
            ],
          ),
        ),
        TextButton(
            onPressed: () {},
            child: edit
                ? const Text('Edit')
                : const Icon(Icons.navigate_next_rounded))
      ],
    ),
  );
}

Widget logoutButton(ProfileController controller) {
  return InkWell(
    onTap: () async {
      await controller.googleSignIn.signOut();
      await LocalStorage().clearAll();
      Get.offAllNamed(Routes.LOGIN);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
            Color(0xFF4E65FF),
            Color(0xFF5BBBE1),
          ])),
      child: const Center(
        child: Text("LOGOUT",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
      ),
    ),
  );
}
