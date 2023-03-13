import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:magic_sign/core/utils/colors.dart';
import 'package:magic_sign/data/models/news.dart';
import '../../../../config/routes/app_pages.dart';
import '../../../../core/utils/date_time.dart';
import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Scrollable(
            viewportBuilder: (BuildContext context, ViewportOffset position) =>
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 30),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Latest News',
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 40,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount: controller.topic.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Obx(() => _topic(index, controller.topic[index]));
                          },
                        )),
                    const Gap(20),
                    Expanded(
                        child: controller.obx(
                                (state) => RefreshIndicator(
                              onRefresh: () => controller.getListNews(),
                              child: CustomScrollView(
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: controller.news.value.isEmpty?
                                    const SizedBox():Padding(
                                      padding:
                                      const EdgeInsets.only(top: 30, bottom: 50),
                                      child: CarouselSlider.builder(
                                          itemCount:
                                          controller.news.value.length >= 15
                                              ? 15
                                              : controller.news.value.length,
                                          itemBuilder: (BuildContext context,
                                              int itemIndex, int pageViewIndex) =>
                                              _lastestNewsItem(
                                                  itemIndex,
                                                  pageViewIndex,
                                                  controller.news.value[itemIndex]),
                                          options: CarouselOptions(
                                            aspectRatio: 4/2.1,
                                            initialPage: 0,
                                            autoPlay: true,
                                            enlargeStrategy:
                                            CenterPageEnlargeStrategy.height,
                                            enlargeCenterPage: true,
                                            // padEnds: false,
                                            autoPlayCurve: Curves.decelerate,
                                            viewportFraction: 0.8,
                                            scrollDirection: Axis.horizontal,
                                          )),
                                    ),
                                  ),
                                  SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            width: Get.width,
                                            height: Get.width / 2,
                                            child: _topicItem(
                                                index, controller.news.value[index]),
                                          );
                                        },
                                        childCount: controller.news.value.length,
                                      )),
                                ],
                              ),
                            ),
                            onLoading: const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                            onError: (error) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.error, color: Colors.red, size: 30),
                                Gap(15),
                                Text('Something went wrong')
                              ],
                            )))
                  ],
                ),
          )),
    );
  }
}

Widget _lastestNewsItem(int itemIndex, int pageIndex, Article? article) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(Routes.NEWS_DETAIL, arguments:{
        'heroTag': 'fhero$itemIndex',
        'article': article
      });
    },
    child: Stack(
      children: [
        Hero(
          tag: 'fhero$itemIndex',
          child: Container(
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(article?.urlToImage ?? ''))),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black45.withOpacity(0.4),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Expanded(
                child: AutoSizeText(article?.author ?? 'Unknown',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12)),
              ),
              const Gap(5),
              Text(article?.title ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              const Spacer(),
              Text(article?.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 11))
            ],
          ),
        )
      ],
    ),
  );
}

Widget _topic(int index, String title) {
  final controller = Get.find<ExploreController>();
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: InkWell(
      onTap: () {
        controller.chooseTopic(index);
      },
      borderRadius: BorderRadius.circular(30),
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2),
            borderRadius: BorderRadius.circular(30),
            color: index == controller.currentTopic.value
                ? const Color(0xFFFF3A44)
                : Colors.white),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: index == controller.currentTopic.value
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ),
  );
}

Widget _topicItem(int index, Article? article) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(Routes.NEWS_DETAIL, arguments:{
        'heroTag': 'hero$index',
        'article': article
      });
    },
    child: Stack(
      children: [
        Hero(
          tag: 'hero$index',
          child: Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(article?.urlToImage ?? ''))),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black45.withOpacity(0.4),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article?.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      child: Text(article?.author ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12))),
                  const Gap(15),
                  Expanded(
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.access_time,
                          size: 15, color: Colors.white),
                      const Gap(10),
                      Flexible(
                        child: Text(
                            AppDateTime.formatDateTypeWeekDay(
                                article?.publishedAt),
                            maxLines: 1,
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12)),
                      )
                    ],
                  )),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
