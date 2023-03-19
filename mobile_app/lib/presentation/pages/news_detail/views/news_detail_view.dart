import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:text_selection_controls/text_selection_controls.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../core/utils/date_time.dart';
import '../controllers/news_detail_controller.dart';

class NewsDetailView extends GetView<NewsDetailController> {
  const NewsDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: NewsDetail()),
          ],
        ),
      ),
    );
  }
}

class NewsDetail extends StatelessWidget {
  NewsDetail({Key? key}) : super(key: key);

  final controller = Get.find<NewsDetailController>();

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
                        Text(controller.article?.title ?? '',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        const Gap(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.access_time,
                                color: Colors.black45, size: 16),
                            const Gap(8),
                            Expanded(
                              child: Text(
                                  AppDateTime.formatDateTypeWeekDay(
                                      controller.article?.publishedAt),
                                  style: const TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const Gap(15)
                          ],
                        ),
                        const Gap(5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.account_circle_rounded,
                                color: Colors.black45, size: 16),
                            const Gap(8),
                            Expanded(
                              child: Text(controller.article?.author ?? '',
                                  style: const TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const Gap(15)
                          ],
                        ),
                      ],
                    )),
                    const Gap(15),
                  ],
                ),
              ),
              const Gap(20),
            ]),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SelectableHtml(
              data: controller.article?.content ?? '',
              selectionControls: FlutterSelectionControls(toolBarItems: [
                ToolBarItem(
                    item: const Text('Translate'),
                    onItemPressed:
                        (String highlightedText, int startIndex, int endIndex) {
                      controller.highlightText.value = highlightedText;
                      Get.find<NewsDetailController>().showVideo.toggle();
                    }),
              ]),
            ),
          ))
        ],
      ),
      floatingActionButton: Obx(
        () => controller.showVideo.value
            ? Stack(
                children: [
                  Container(
                    height: 250,
                    width: 150,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: WebView(
                      key: const Key('Web view'),
                      initialUrl:
                          '${dotenv.get('WEBURL')}/?q=${controller.highlightText}',
                      javascriptMode: JavascriptMode.unrestricted,
                      gestureNavigationEnabled: true,
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          Get.find<NewsDetailController>().showVideo.toggle();
                        },
                        icon: Icon(Icons.cancel_sharp,
                            color: Colors.black.withOpacity(0.3)),
                      ))
                ],
              )
            : const SizedBox(),
      ));
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

  Widget buildBackground(double shrinkOffset) => Opacity(
      opacity: disappear(shrinkOffset),
      child: Stack(
        children: [
          Hero(
            tag: Get.find<NewsDetailController>().heroTag,
            child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(Get.find<NewsDetailController>()
                                .article
                                ?.urlToImage ??
                            '')),
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
          ),
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

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
