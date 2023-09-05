import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_demo/apputils.dart';
import 'package:social_demo/custom_nav_bar.dart';
import 'package:social_demo/drawer_builder.dart';
import 'package:social_demo/services.dart';
import 'package:social_demo/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class SubHomeScreen extends StatefulWidget {
  const SubHomeScreen({Key? key}) : super(key: key);

  @override
  State<SubHomeScreen> createState() => _SubHomeScreenState();
}

class _SubHomeScreenState extends State<SubHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int currentPage = 0;
  final PageController _pageController = PageController();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  List<String> videoUrlList = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
  ];

  // late VideoPlayerController controller;
  Future<void>? initializeVideoPlayerFuture;

  final List<VideoPlayerController> _videoPlayerControllers = [];
  int _currentVideoIndex = 0;

  @override
  void dispose() {
    setState(() {
      _videoPlayerControllers[_currentVideoIndex].dispose();
    });
    super.dispose();
  }

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await _videoPlayerControllers[_currentVideoIndex].dispose();
    // });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (int i = 0; i < 4; i++) {
        _videoPlayerControllers.add(VideoPlayerController.networkUrl(
            Uri.parse(videoUrlList[i].toString()),
            videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true)));
        initializeVideoPlayerFuture =
            _videoPlayerControllers[i].initialize().then((value) {
          setState(() {});
        });
        _videoPlayerControllers[i].setLooping(false);
        _videoPlayerControllers[i].play();
      }
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: const DrawerBuilder(),
        bottomNavigationBar: const CustomBottomNav(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight(context) * 0.16),
          child: Column(
            children: [
              AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Color(0xffFE6A00),
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.light,
                ),
                elevation: 0,
                backgroundColor: Colors.white,
                leading: InkWell(
                  onTap: _openDrawer,
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage("asset/avatar.png"),
                    ),
                  ),
                ),
                centerTitle: true,
                title: const Text(
                  "Church Street",
                  style: TextStyle(color: Color(0xffFE6A00)),
                ),
                actions: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "asset/noti.png",
                              scale: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1.0),
                              child: Image.asset(
                                "asset/noti2.png",
                                scale: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        right: 7,
                        top: 6,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Color(0xff231F1F),
                          child: Center(
                            child: Text(
                              "1",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth(context) * 0.6,
                      child: Row(
                        children: [
                          Image.asset(
                            "asset/3star.png",
                            scale: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Your Loyalty points",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text("2,324",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image.asset(
                              "asset/star.png",
                              scale: 5,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: SizedBox(
          width: screenWidth(context),
          height: screenHeight(context),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _videoPlayerControllers.length,
                scrollDirection: Axis.vertical,
                onPageChanged: (int index) {
                  setState(() {
                    _currentVideoIndex = index;
                    _videoPlayerControllers[_currentVideoIndex].play();
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                        width: screenWidth(context),
                        child: FutureBuilder(
                          future: initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              // If the VideoPlayerController has finished initialization, use
                              // the data it provides to limit the aspect ratio of the video.
                              return AspectRatio(
                                  aspectRatio: _videoPlayerControllers[index]
                                      .value
                                      .aspectRatio,
                                  child: VideoPlayer(
                                      _videoPlayerControllers[index]));
                            } else {
                              // If the VideoPlayerController is still initializing, show a
                              // loading spinner.
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        )),
                  );
                },
              ),
              Positioned(
                  top: 20,
                  right: 10,
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: _currentVideoIndex == 0
                                ? Colors.white
                                : const Color(0xffFE6A00),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                    color: _currentVideoIndex == 0
                                        ? const Color(0xffFE6A00)
                                        : Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: _currentVideoIndex == 1
                                ? Colors.white
                                : const Color(0xffFE6A00),
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                    color: _currentVideoIndex == 1
                                        ? const Color(0xffFE6A00)
                                        : Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: _currentVideoIndex == 2
                                ? Colors.white
                                : const Color(0xffFE6A00),
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    color: _currentVideoIndex == 2
                                        ? const Color(0xffFE6A00)
                                        : Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: _currentVideoIndex == 3
                                ? Colors.white
                                : const Color(0xffFE6A00),
                            child: Center(
                              child: Text(
                                "4",
                                style: TextStyle(
                                    color: _currentVideoIndex == 3
                                        ? const Color(0xffFE6A00)
                                        : Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              _currentVideoIndex == 1
                  ? Positioned(
                      top: screenHeight(context) * .51,
                      left: screenWidth(context) * 0.2,
                      child: Container(
                        width: screenWidth(context) * 0.6,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            SizedBox(
                              width: screenWidth(context) * 0.5,
                              child: const Center(
                                  child: Text(
                                "Forum",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset("asset/Arrow.png",
                                    scale: 6, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ))
                  : const SizedBox(),
              Positioned(
                top: screenHeight(context) * .58,
                left: screenWidth(context) * 0.2,
                child: Container(
                  width: screenWidth(context) * 0.6,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: screenWidth(context) * 0.5,
                        child: Center(
                            child: Text(
                          _currentVideoIndex == 0
                              ? "Oder Now"
                              : _currentVideoIndex == 1
                                  ? "Collaborate Now"
                                  : _currentVideoIndex == 2
                                      ? "Buy Tickets"
                                      : "Buy Work Pass",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        )),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Image.asset(
                            "asset/Arrow.png",
                            scale: 6,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
