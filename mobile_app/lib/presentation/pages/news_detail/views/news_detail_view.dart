import 'package:better_player/better_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../core/utils/date_time.dart';
import '../../../../gen/assets.gen.dart';
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
            // Container(
            //   margin: const EdgeInsets.all(20),
            //   width: Get.width,
            //   child: Row(
            //     children: [
            //       Expanded(child: TextField(
            //         maxLines: 2,
            //         minLines: 2,
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(18.0),
            //             borderSide:
            //             const BorderSide(width: 3, color: Colors.black),
            //           ),
            //         ),
            //       ),),
            //       IconButton(onPressed: (){
            //
            //       }, icon: Icon(Icons.swap_horizontal_circle_outlined))
            //     ],
            //   ),
            // ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _openCustomDialog();
          },
          child: Image.asset(Assets.image.icSign.path),
        ),
      ),
    );
  }

  void _openCustomDialog() {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: const Text('Translate'),
                content: TextField(
                  controller: Get.find<NewsDetailController>().txtController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    // suffixIcon: IconButton(
                    //     onPressed: () async {
                    //       // await controller.startRecognizingWithUi();
                    //     },
                    //     icon: const Icon(Icons.mic)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide:
                          const BorderSide(width: 3, color: Colors.black),
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Cancel')),
                  TextButton(onPressed: () async  {
                    FocusManager.instance.primaryFocus?.unfocus();
                    await Get.find<NewsDetailController>().getSignVideo();
                    if(Get.find<NewsDetailController>().getVideoStatus.isSuccess){
                      _showDialog();
                    }
                  }, child: const Text('Translate'))
                ],
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: Get.context!,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }

  _showDialog(){
    showGeneralDialog(
      context: Get.context!,
      barrierColor: Colors.black12.withOpacity(0.9), // Background color
      barrierDismissible: true,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return const Center(
          child: MemoryPlayerPage(),
        );
      },
    ).then((value) => Get.back());
  }
}

class NewsDetail extends StatelessWidget {
  NewsDetail({Key? key}) : super(key: key);
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };



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
                          Text(
                              Get.find<NewsDetailController>().article?.title ??
                                  '',
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
                                        Get.find<NewsDetailController>()
                                            .article
                                            ?.publishedAt),
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
                                child: Text(
                                    Get.find<NewsDetailController>()
                                            .article
                                            ?.author ??
                                        '',
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
              child: SizedBox(
                height: 500,
                child: WebViewWidget(
                  controller: WebViewController()
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..loadRequest(Uri.parse(Get.find<NewsDetailController>().article?.url ?? '')),
                  gestureRecognizers: gestureRecognizers,
                ),
              ),
            )
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

class MemoryPlayerPage extends StatefulWidget {
  const MemoryPlayerPage({Key? key}) : super(key: key);

  @override
  _MemoryPlayerPageState createState() => _MemoryPlayerPageState();
}

class _MemoryPlayerPageState extends State<MemoryPlayerPage> {
  late BetterPlayerController _betterPlayerController;
  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
    const BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _setupDataSource();
    super.initState();
  }

  void _setupDataSource() async {
    List<int> bytes = Get.find<NewsDetailController>().bytes.value;
    BetterPlayerDataSource dataSource =
    BetterPlayerDataSource.memory(bytes, videoExtension: "mp4");
    _betterPlayerController.setupDataSource(dataSource);
    // BetterPlayerDataSource dataSource = BetterPlayerDataSource.network(
    //     'https://res.cloudinary.com/h3gg/video/upload/v1665173896/appsup-2022/basketball_slxptx.mp4');
    // _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(controller: _betterPlayerController),
      ),
    );
  }
}
