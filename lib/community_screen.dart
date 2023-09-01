import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
import 'package:social_demo/apputils.dart';
import 'package:social_demo/custom_nav_bar.dart';
import 'package:social_demo/drawer_builder.dart';
import 'package:social_demo/searching_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  List<String> nameList = [
    "FOOD",
    "MUSIC",
    "DESIGN",
    "BUSINESS",
    "FOOD",
    "MUSIC",
    "DESIGN",
    "BUSINESS",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: const DrawerBuilder(),
      bottomNavigationBar: const CustomBottomNav(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border(bottom: BorderSide(color: Colors.black12))
          ),
          padding: const EdgeInsets.only(top: 10),
          child: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xffFE6A00),
              statusBarIconBrightness: Brightness.light,
              // For Android (dark icons)
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
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: SizedBox(
        width: screenWidth(context),
        height: screenHeight(context),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: screenHeight(context) * 0.4,
                // width: screenWidth(context),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    image: DecorationImage(
                        image: AssetImage("asset/community_Image.png"),
                        scale: 2)),
                child: Stack(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: screenHeight(context) * 0.05),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Engage with your",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                )),
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(" COMMUNITY ",
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Color(0xffFE6A00),
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Container(
                              width: screenWidth(context) * 0.9,
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text(
                                  "By meeting people at social or interacting online on our digital boards.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                            Container(
                              width: screenWidth(context) * 0.9,
                              padding: EdgeInsets.only(
                                  top: screenHeight(context) * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const SearchingScreen()));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 25),
                                      decoration: const BoxDecoration(
                                        color: Color(0xffFE6900),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "COLLABORATE NOW",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 25),
                                    decoration: const BoxDecoration(
                                      color: Color(0xffFE6900),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "FORUM",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 60,
                  width: screenWidth(context),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth(context) * 0.8,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: nameList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, item) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                margin: const EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    color: const Color(0xffFE6A00),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    nameList[item],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              );
                            }),
                      ),
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xffFE6A00),
                        backgroundImage: AssetImage(
                          "asset/Filter.png",
                        ),
                      )
                    ],
                  )),
              ListView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, item) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: screenWidth(context) * 0.8,
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundImage: AssetImage(
                                              "asset/avatar.png"),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Savita Kumar",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.w600,
                                                ),
                                              ),
                                              Text("Cloud engineer, Music",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black26,
                                                    fontWeight:
                                                        FontWeight.w500,
                                                  ))
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                                const Icon(Icons.more_vert)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Image.asset(
                                "asset/community_list_image.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("asset/heart.png",
                                        scale: 4),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("1.5K",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "asset/comment.png",
                                        scale: 4,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("1.5K",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: ReadMoreText(
                              'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                              trimLines: 2,
                              colorClickableText: Colors.pink,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              moreStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              lessStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      )),
    );
  }
}
