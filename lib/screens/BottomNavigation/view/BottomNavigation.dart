import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vlc_player/screens/audio/view/AudioPage.dart';
import 'package:vlc_player/screens/videos/view/videoPage.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  List bNb = [
    VideoPage(),
    AudioPage(),
  ];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: bNb[i],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              i = index;
            });
          },
          currentIndex: i,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library_outlined), label: "Video"),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music_outlined), label: "Music"),
          ],
        ),
      ),
    );
  }
}
