import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../config/routes/app_pages.dart';
import '../controllers/course_detail_controller.dart';

class CourseDetailView extends GetView<CourseDetailController> {
  const CourseDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: CourseDetail()),
    );
  }
}

class CourseDetail extends StatelessWidget {
  CourseDetail({Key? key}) : super(key: key);
  final controller = Get.find<CourseDetailController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate:
                  CustomSliverAppBarDelegate(expandedHeight: Get.height * 0.35),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Column(children: [
                const Gap(25),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      const Gap(20),
                      const VerticalDivider(color: Colors.orange, thickness: 5),
                      const Gap(10),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.course.title ?? '',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          const Gap(5),
                        ],
                      )),
                      const Gap(15),
                    ],
                  ),
                ),
              ]),
            ),
            const SliverPadding(
                padding:
                    EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
                sliver: SliverToBoxAdapter(
                  child: Text('Lesson',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                )),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              sliver: SliverList(
                  key: GlobalKey(),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return lesson(index);
                    },
                    childCount: controller.course.lessons?.length ?? 0,
                  )),
            ),
            const SliverPadding(
                padding:
                    EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
                sliver: SliverToBoxAdapter(
                  child: Text('Quiz',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                )),
            SliverPadding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 100),
                sliver: SliverToBoxAdapter(
                    child: Row(
                  children: [
                    const Expanded(
                        child: Text('Practicing Mixture Problems in Algebra')),
                    const Gap(20),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.QUIZ, arguments: controller.course.quiz);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                            color: const Color(0xFF4C6ED7).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          'Take Quiz',
                          style: TextStyle(color: Color(0xFF4C6ED7)),
                        ),
                      ),
                    )
                  ],
                ))),
          ],
        ),
      );
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          title: const Text('News'),
          centerTitle: true,
          backgroundColor: const Color(0xFF326273),
        ),
      );

  Widget buildBackground(double shrinkOffset) {
    final controller = Get.find<CourseDetailController>();
    return Opacity(
        opacity: disappear(shrinkOffset),
        child: Stack(
          children: [
            Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(controller.course.thumbnail ?? '')),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)))),
            Positioned(
                top: 15,
                left: 15,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                )),
          ],
        ));
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

Widget lesson(int index) {
  final controller = Get.find<CourseDetailController>();
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Row(
      children: [
        Text(controller.course.lessons?[index].word ?? ''),
        const Spacer(),
        IconButton(
            onPressed: () {
              Get.toNamed(Routes.LESSON_DETAIL,
                  arguments: controller.course.lessons?[index]);
            },
            icon: const Icon(Icons.play_circle_fill, color: Colors.blue))
      ],
    ),
  );
}
