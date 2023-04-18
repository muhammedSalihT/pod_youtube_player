import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class PlayVideoFromYoutube extends StatefulWidget {
  const PlayVideoFromYoutube({Key? key}) : super(key: key);

  @override
  State<PlayVideoFromYoutube> createState() => _PlayVideoFromYoutubeState();
}

class _PlayVideoFromYoutubeState extends State<PlayVideoFromYoutube> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      podPlayerConfig: const PodPlayerConfig(
          autoPlay: false, videoQualityPriority: [720, 360]),
      playVideoFrom: PlayVideoFrom.youtube(
          'https://www.youtube.com/watch?v=w_GSjL0Ftf8&ab_channel=ExamWinnerPrivateLive'),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PodVideoPlayer(
          controller: controller,
          videoThumbnail: const DecorationImage(
              image: AssetImage("assets/Logo.png"),),
        ),
      ),
    );
  }
}
