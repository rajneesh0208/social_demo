import 'package:flutter/material.dart';
import 'package:social_demo/apputils.dart';

class DrawerBuilder extends StatefulWidget {
  const DrawerBuilder({Key? key}) : super(key: key);

  @override
  State<DrawerBuilder> createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends State<DrawerBuilder> {
  bool isSelected = false;

  final MaterialStateProperty<Color?> trackColor =
  MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      // Track color when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return Color(0xffFE6900);
      }
      // Otherwise return null to set default track color
      // for remaining states such as when the switch is
      // hovered, focused, or disabled.
      return null;
    },
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: screenWidth(context) * 0.8,
      backgroundColor: Colors.white,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xffF8F8F8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("asset/avatar.png"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kumar Kiran",
                                style: TextStyle(
                                    color: Color(0xff0E0E0E),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0),
                              ),
                              Text(
                                "Artist",
                                style: TextStyle(
                                    color: Color(0xff0E0E0E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 8),
                        decoration: BoxDecoration(
                            color: const Color(0xffEBEBEB),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "2,324",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Image.asset(
                                  "asset/star.png",
                                  scale: 6,
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          customListWidget(Icons.person_3_outlined, "Profile", "0% Completed"),
          customListWidget(Icons.star_border_outlined, "Social Squad", ""),
          customListWidget(Icons.flag_outlined, "Report an Issue", ""),
          customListWidget(Icons.person_3_outlined, "Exit In-store Mode", ""),
          incognitoWidget("asset/incognito.png", "Go Stealth Mode",
              "Not interested in meeting people")
        ],
      ),
    );
    ;
  }

  Widget customListWidget(dynamic leading, text1, text2) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xffFF6900),
                    child: Center(
                      child: Icon(
                        leading,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth(context) * 0.4,
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text1,
                          style: const TextStyle(
                              color: Color(0xff0E0E0E),
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        Text(
                          text2,
                          style: const TextStyle(
                              color: Color(0xff454545),
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  "asset/Arrow.png",
                  scale: 5,
                ),
              )
            ],
          ),
          const Divider(
            color: Color(0xffE3E3E3),
            height: 25,
            thickness: 2,
          )
        ],
      ),
    );
  }

  Widget incognitoWidget(image, String text1, String text2) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xffFF6900),
                    // backgroundImage: AssetImage(image),
                    child: Image.asset(image,scale: 4,),
                  ),
                  Container(
                    width: screenWidth(context) * 0.45,
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text1,
                          style: const TextStyle(
                              color: Color(0xff0E0E0E),
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        Text(
                          text2,
                          style: const TextStyle(
                              color: Color(0xff454545),
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Switch(
                  activeColor: Color(0xffFE6900),
                    thumbColor: const MaterialStatePropertyAll<Color>(Colors.white),
                    trackColor: trackColor,

                    value: isSelected,
                    onChanged: (val) {
                      setState(() {
                        isSelected = val;
                      });
                    }),
              )
            ],
          ),
          const Divider(
            color: Color(0xffE3E3E3),
            height: 25,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
