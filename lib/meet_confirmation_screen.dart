import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_demo/apputils.dart';
import 'package:social_demo/inStore_list_screen.dart';
import 'package:video_player/video_player.dart';

class MeetConfirmationScreen extends StatefulWidget {
  final String tableNumber;

  const MeetConfirmationScreen({Key? key, required this.tableNumber})
      : super(key: key);

  @override
  State<MeetConfirmationScreen> createState() => _MeetConfirmationScreenState();
}

class _MeetConfirmationScreenState extends State<MeetConfirmationScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("asset/confirmation.mp4");
    _initializeVideoPlayerFuture =
        _controller.initialize().then((_) => _controller.play());
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight(context) * 0.6),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                left: screenWidth(context) * 0.2,
                top: screenHeight(context) * 0.15,
                child: SizedBox(
                  width: screenWidth(context) * 0.6,
                  child: const Text("REQUEST SENT SUCCESSFULLY",
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )),
                )),
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),*/
      body: SafeArea(
        child: Container(
          width: screenWidth(context),
          height: screenHeight(context),
          child: Column(
            children: [
              Container(
                height: screenHeight(context) * 0.6,
                width: screenWidth(context),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        left: screenWidth(context) * 0.2,
                        top: screenHeight(context) * 0.15,
                        child: SizedBox(
                          width: screenWidth(context) * 0.6,
                          child: const Text("REQUEST SENT SUCCESSFULLY",
                              style: TextStyle(
                                fontSize: 34,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              )),
                        )),
                    FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          // If the VideoPlayerController has finished initialization, use
                          // the data it provides to limit the aspect ratio of the video.
                          return Container(
                            width: screenWidth(context),
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              // Use the VideoPlayer widget to display the video.
                              child: VideoPlayer(_controller),
                            ),
                          );
                        } else {
                          // If the VideoPlayerController is still initializing, show a
                          // loading spinner.
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ],
                ) ,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffFE6A00)
                  ),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: screenHeight(context) *0.05),
                      child: const Text(
                          "Successfully accepted ",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          )
                      ),),
                      Padding(padding: EdgeInsets.only(top: screenHeight(context) *0.02),
                      child: const Text(
                          "Meet Kumar Kiran at ",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          )
                      ),),
                      Padding(padding: EdgeInsets.only(top: screenHeight(context) *0.01),
                      child: Text(
                          "Table No : ${widget.tableNumber ?? "20"} ",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )
                      ),),
                      Padding(padding: EdgeInsets.only(top: screenHeight(context) *0.05),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InStoreListScreen()));
                        },
                        child: Container(

                          margin: const EdgeInsets.symmetric(
                              horizontal: 20),
                          padding: const EdgeInsets
                              .symmetric(vertical: 15),
                          decoration: const BoxDecoration(
                              color: Color(0xffffffff)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width:screenWidth(context) * 0.35,
                                    ),
                                    const Text(
                                        "Continue",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffFE6A00),
                                          fontWeight: FontWeight
                                              .w700,
                                        )
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Icon(Icons.arrow_forward,color: Color(0xffFE6A00) ,),
                                ),
                              )
                            ],
                          ),),
                      ),)
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
