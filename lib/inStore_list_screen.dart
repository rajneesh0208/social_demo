import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_demo/apputils.dart';
import 'package:social_demo/meet_confirmation_screen.dart';

class InStoreListScreen extends StatefulWidget {
  const InStoreListScreen({Key? key}) : super(key: key);

  @override
  State<InStoreListScreen> createState() => _InStoreListScreenState();
}

class _InStoreListScreenState extends State<InStoreListScreen> {
  var tableController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: AppBar(
            backgroundColor: const Color(0xffFE6A00),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xffFE6A00),
              statusBarIconBrightness: Brightness.light,
              // For Android (dark icons)
              statusBarBrightness: Brightness.light,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              "In-Store", style: TextStyle(color: Colors.white),),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Image.asset(
                  "asset/refresh.png", scale: 5, color: Colors.white,),
              )
            ],
          ),
        ),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: const BoxDecoration(
            color: Color(0xffE3E3E3)
        ),
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * 0.12,
              width: screenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Get ',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'SOCIAL', style: TextStyle(
                          fontSize: 24,
                          color: Color(0xffFE6A00),
                          fontWeight: FontWeight.w700,
                        )),
                        TextSpan(text: ' networking', style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        )),
                      ],
                    ),
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 30, right: 10),
                        child: Text(
                            "SOCAILITES WITH YOU",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            )
                        ),),
                      Text(
                          "(125)",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(top: 1),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    decoration: const BoxDecoration(
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: screenWidth(context) * 0.7,
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(
                                    "asset/avatar.png"),
                              ),
                              Padding(padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: screenWidth(context) * 0.5,
                                      child: const Text(
                                          "Ronald Richards",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          )
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth(context) * 0.5,
                                      child: const Text(
                                          "Cloud Engineer",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                          )
                                      ),
                                    )
                                  ],
                                ),)
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context,
                                        void Function(void Function()) setState) {
                                      return AlertDialog(
                                        contentPadding: const EdgeInsets.all(
                                            10),
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Align(
                                                alignment: Alignment.topRight,
                                                child: Icon(Icons.close,
                                                  color: Colors.black,),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                "Enter your table number",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight
                                                        .w700),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                "When you accept to meet, you’ll sharing your table number to meet the person.",
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight
                                                        .w500),
                                              ),
                                            ),
                                            Container(
                                              width: screenWidth(context) * 0.9,
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: TextField(
                                                controller: tableController,
                                                keyboardType: TextInputType
                                                    .multiline,
                                                decoration: const InputDecoration(
                                                    border: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0xffFE6A00))
                                                    ),
                                                    enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0xffFE6A00))
                                                    ),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0xffFE6A00))
                                                    )
                                                ),
                                              ),),

                                            InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (
                                                        context) => MeetConfirmationScreen(tableNumber : tableController.text)));
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 20),
                                                padding: const EdgeInsets
                                                    .symmetric(vertical: 15),
                                                decoration: const BoxDecoration(
                                                    color: Color(0xffFE6A00)
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                      "Done",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight
                                                            .w700,
                                                      )
                                                  ),
                                                ),),
                                            )

                                          ],

                                        ),
                                      );
                                    },
                                  );
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            decoration: const BoxDecoration(
                              color: Color(0xffFE6900),
                            ),
                            child: const Center(
                              child: Text(
                                "MEET",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  );
                }))

          ],
        ),
      ),
    );
  }
}
