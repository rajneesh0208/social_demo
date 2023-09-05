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
      width: screenWidth(context),
      height: screenHeight(context) * 0.08,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: screenWidth(context) * 0.40,
            right: screenWidth(context) * 0.4,
            top: -screenHeight(context) * 0.045,
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
                    radius: screenWidth(context) * 0.10,
                    backgroundColor: const Color(0xffFE6A00),
                    child: Padding(
                      padding:
                      EdgeInsets.only(top: screenWidth(context) * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth(context) * 0.055),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
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
                            padding: EdgeInsets.only(top: 5.0),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 12),
                      width: screenWidth(context) * 0.18,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "560\n005",
                            style: TextStyle(
                              color: Color(0xffC35200),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              color: Color(0xffC35200),
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: screenWidth(context) * 0.20,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "asset/food.png",
                            scale: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "Eat & Drink",
                              style: TextStyle(
                                color: Color(0xffFE6A00),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: screenWidth(context) * 0.18,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "asset/rock.png",
                            scale: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "Events",
                              style: TextStyle(
                                color: Color(0xffFE6A00),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      width: screenWidth(context) * 0.24,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "asset/social_work.png",
                            scale: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "Social Works",
                              style: TextStyle(
                                color: Color(0xffFE6A00),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
