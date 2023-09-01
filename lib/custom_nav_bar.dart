import 'package:flutter/material.dart';
import 'package:social_demo/apputils.dart';
import 'package:social_demo/community_screen.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: 20),
      width: screenWidth(context),
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: screenWidth(context) * 0.38,
            top: -60,
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CommunityScreen()));
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xffFE6A00),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  "asset/L1.png",
                                  scale: 8,
                                ),
                                Image.asset(
                                  "asset/R1.png",
                                  scale: 8,
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text("Community",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: screenWidth(context) * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: screenWidth(context) * 0.10,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              child: Text("560\n005",style: TextStyle(
                                color: Color(0xffC35200),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),)
                              ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "Home",
                              style: TextStyle(
                                  color: Color(0xffC35200),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: screenWidth(context) * 0.08,
                              child: Image.asset("asset/food.png")),
                          const Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: const Text(
                              "Eat & Drink",
                              style: TextStyle(
                                  color: Color(0xffFE6A00),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: screenWidth(context) * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: screenWidth(context) * 0.08,
                            child: SizedBox(
                                width: screenWidth(context) * 0.08,
                                child: Image.asset("asset/rock.png")),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: const Text(
                              "Events",
                              style: TextStyle(
                                  color: Color(0xffFE6A00),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: screenWidth(context) * 0.08,
                              child: Image.asset("asset/social_work.png")),
                          const Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: const Text(
                              "Social Works",
                              style: TextStyle(
                                  color: Color(0xffFE6A00),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13),
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
        ],
      ),
    );
  }
}
