import 'package:flutter/material.dart';
import 'package:social_demo/apputils.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerScreen({Key? key,required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  Future<void>? initializeVideoPlayerFuture;
  late VideoPlayerController _videoPlayerControllers;

  @override
  void dispose() {
        _videoPlayerControllers.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _videoPlayerControllers = VideoPlayerController.networkUrl(Uri.parse(
        widget.videoUrl))..initialize().then((_) {
    // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    setState(() {});
    });

    // initializeVideoPlayerFuture = _videoPlayerControllers.initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
    _videoPlayerControllers.setLooping(false);
    _videoPlayerControllers.play();
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      body: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
              width: screenWidth(context),
              child: _videoPlayerControllers.value.isInitialized
                  ? AspectRatio(
                  aspectRatio: _videoPlayerControllers
                      .value
                      .aspectRatio,
                  child: VideoPlayer(
                      _videoPlayerControllers))
                  :Container()

            /*FutureBuilder(
                future: initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the video.
                    return AspectRatio(
                        aspectRatio: _videoPlayerControllers
                            .value
                            .aspectRatio,
                        child: VideoPlayer(
                            _videoPlayerControllers));
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )*/),
        ),
      ),
    ), onWillPop: ()async{
      _videoPlayerControllers.pause();
      return true;
    });
  }
}
