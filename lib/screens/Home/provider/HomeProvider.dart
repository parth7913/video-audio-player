import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:vlc_player/screens/Home/model/homeModel.dart';

class HomeProvider extends ChangeNotifier {
  bool isPlay = false;
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  HomeModel? H1;
  List<HomeModel> imageList = [
    HomeModel(
        image: "assets/images/apna.jpg",
        name: "Apna Bana le",
        video: "assets/video/apnabanale.mp4"),
    HomeModel(
        image: "assets/images/beshram.jpg",
        name: "Besharam Rang",
        video: "assets/video/besharamrang.mp4"),
    HomeModel(
        image: "assets/images/sulthan.jpg",
        name: "Sulthan",
        video: "assets/video/sulthankgf.mp4"),
    HomeModel(
        image: "assets/images/brahmastra.jpg",
        name: "Brahmastra",
        video: "assets/video/BrahamstraTrailer.mp4"),
    HomeModel(
        image: "assets/images/JehdaNasha.jpg",
        name: "Jehda Nasha",
        video: "assets/video/JehdaNasha.mp4"),
    HomeModel(
        image: "assets/images/FalakTuGarajTu.jpg",
        name: "Falak Tu Garaj Tu",
        video: "assets/video/FalakTuGarajTu.mp4"),
    HomeModel(
        image: "assets/images/JustLookUp.jpg",
        name: "Just Look Up",
        video: "assets/video/JustLookUp.mp4"),
  ];

  void changePlay(bool video) {
    isPlay = video;
    notifyListeners();
  }

  void loadVideo() {
    videoPlayerController = VideoPlayerController.asset("${H1!.video}")
      ..initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
    );
  }
}
