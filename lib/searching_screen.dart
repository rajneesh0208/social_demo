import 'package:flutter/material.dart';
import 'package:social_demo/apputils.dart';
import 'package:social_demo/inStore_list_screen.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({Key? key}) : super(key: key);

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> with TickerProviderStateMixin {

  late AnimationController controller1;
  late Animation<double> animation1;
  late AnimationController controller2;
  late Animation<double> animation2;
  late AnimationController controller3;
  late Animation<double> animation3;
  late AnimationController controller4;
  late Animation<double> animation4;


  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    animation1 = Tween<double>(begin: 0, end: 1).animate(controller1)
      ..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    animation2 = Tween<double>(begin: 0, end: 1).animate(controller2)
      ..addListener(() {
        setState(() {});
      });

    controller3 = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    animation3 = Tween<double>(begin: 1, end: 0.25).animate(controller3)
      ..addListener(() {
        setState(() {});
      });

    controller4 = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    animation4 = Tween<double>(begin: 1, end: 0).animate(controller4)
      ..addListener(() {
        setState(() {});
      });


    startAnimations();

    Future.delayed(Duration(seconds: 5),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InStoreListScreen()));
    },);

  }

  startAnimations() async {

    controller4.forward();

    Future.delayed(const Duration(seconds: 1), () => controller3.forward());

    Future.delayed(const Duration(seconds: 2), () => controller2.forward());

    Future.delayed(const Duration(seconds: 3), () => controller1.forward());


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[800],
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.01),
        child: Container(
          margin: EdgeInsets.only(top: screenHeight(context) * 0.4),
          child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [

                  Positioned(top: screenHeight(context) * 0.4,
                      left: screenWidth(context) * 0.3 ,
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                                "Searching....",
                                style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                )
                            ),
                            Padding(padding: EdgeInsets.only(top: 5),child: Text(
                                "For SOCIAL-ites around you",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff351600),
                                  fontWeight: FontWeight.w600,
                                )
                            ),)
                          ],
                        ),
                      )),

                  Positioned(
                    // top: size.height * 0.005,
                    left: -20,
                    right: -20,
                    child: Opacity(
                      opacity: animation1.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Image.asset(
                              "asset/L4.png",
                              width: 52.830238342285156,
                              height: 179.97738647460938,
                            ),
                            // height: size.height * 0.25,
                            // width: size.width * 0.03,
                          ),
                          Container(
                            child: Image.asset(
                              "asset/R4.png",
                              width: 52.830238342285156,
                              height: 179.97738647460938,
                            ),
                            // height: size.height * 0.25,
                            // width: size.width * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight(context) * 0.02,
                    left: screenWidth(context) * 0.1,
                    right: screenWidth(context) * 0.1,
                    child: Opacity(
                      opacity: animation2.value,
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset(
                              "asset/L3.png",
                              width: 39.8441276550293,
                              height: 135.73745727539062,
                            ),
                            // height: size.width * 0.2,
                            // width: size.width * 0.03,
                          ),
                          const Spacer(),
                          Container(
                            child: Image.asset(
                              "asset/R3.png",
                              width: 39.8441276550293,
                              height: 135.73745727539062,
                            ),
                            // height: size.width * 0.2,
                            // width: size.width * 0.03,
                            // color: Colors.yellow,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight(context) * 0.04,
                    left: screenWidth(context) * 0.2,
                    right: screenWidth(context) * 0.2,
                    child: Opacity(
                      opacity: animation3.value,
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset(
                              "asset/L2.png",
                              width: 26.418439865112305,
                              height: 90,
                            ),
                            // height: size.width * 0.15,
                            // width: size.width * 0.03,
                            // color: Colors.lightBlue,
                          ),
                          const Spacer(),
                          Container(
                            child: Image.asset(
                              "asset/R2.png",
                              width: 26.418439865112305,
                              height: 90,
                            ),
                            // height: size.width * 0.15,
                            // width: size.width * 0.03,
                            // color: Colors.lightBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight(context) * 0.055,
                    left: screenWidth(context) * 0.28,
                    right: screenWidth(context) * 0.28,
                    child: Opacity(
                      opacity: animation4.value,
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset(
                              "asset/L1.png",
                              width: 17.612293243408203,
                              height: 60,
                            ),

                            // height: size.height * 0.1,
                            // width: size.width * 0.03,
                            // color: Colors.lightGreen,
                          ),
                          const Spacer(),
                          Container(
                            child: Image.asset(
                              "asset/R1.png",
                              width: 17.612293243408203,
                              height: 60,
                            ),
                            // height: size.height * 0.1,
                            // width: size.width * 0.03,
                            // color: Colors.lightGreen,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight(context) * 0.065,
                    left: screenWidth(context) * 0.3,
                    right: screenWidth(context) * 0.3,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                          "SOCIAL",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          )
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
