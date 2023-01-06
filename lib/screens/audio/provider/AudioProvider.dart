import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:vlc_player/screens/audio/model/audioModel.dart';

class audioProvider extends ChangeNotifier {
  bool isPlay = false;
  Audiomodel? a1;
  String? songpath;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration songDuration = Duration(seconds: 0);
  List<Audiomodel> audioList = [
    Audiomodel(
        image: "assets/images/apnabana.jpg",
        name: "Apna Bana le",
        subname: "Arijit Singh,Sachin–Jigar",
        audio: "assets/audio/ApnaBanale.mp3",
        play: false,
        Ahead: false,
        Astop: true,
        ind: 0),
    Audiomodel(
        image: "assets/images/beshramrang.jpg",
        name: "Besharam Rang",
        subname: "Caralisa Monteiro,Shilpa Rao,Vishal–Shekha",
        audio: "assets/audio/BesharamRang.mp3",
        play: false,
        Ahead: false,
        Astop: true,
        ind: 1),
    Audiomodel(
        image: "assets/images/sulthankgf.jpg",
        name: "Sulthan",
        subname: "Brijesh Shandilya,Mohan Krishna",
        audio: "assets/audio/SulthanKgf.mp3",
        play: false,
        Ahead: false,
        Astop: true,
        ind: 2),
    Audiomodel(
        image: "assets/images/brahmastrashiva.jpg",
        name: "Shiva theme song",
        subname: "Pritam Chakraborty",
        audio: "assets/audio/Shivathemesong.mp3",
        play: false,
        Ahead: false,
        Astop: true,
        ind: 3),
    Audiomodel(
        image: "assets/images/JehdaNashaHero.jpg",
        name: "Jehda Nasha",
        subname: "Amar Jalal,Yohani,IP Singh,Harjot Kaur",
        audio: "assets/audio/JehndaNashaSong.mp3",
        play: false,
        Ahead: false,
        Astop: true,
        ind: 4),
    Audiomodel(
        image: "assets/images/FalakTuGarajTukgf.jpg",
        name: "Falak Tu Garaj Tu",
        subname: "Ravi Basrur,Suchetha Basrur",
        audio: "assets/audio/FalakTuGarajTuSong.mp3",
        play: false,
        Ahead: false,
        Astop: true,
        ind: 5),
    Audiomodel(
        image: "assets/images/AOT.jpg",
        name: "The Fall Of Paradise",
        subname: "Attack on titan ost",
        audio: "assets/audio/AOT.mp3",
        play: false,
        Ahead: false,
        Astop: true,
        ind: 6),
  ];

  void changePlay(bool value, index) {
    audioList[index].play = value;
    notifyListeners();
  }

  void changeAhead(bool value, index) {
    audioList[index].Ahead = value;
    notifyListeners();
  }
void changestop(bool value, index) {
    audioList[index].Astop= value;
    notifyListeners();
  }

  void Data(Audiomodel aa) {
    a1 = aa;
    notifyListeners();
  }

  void Path(path) {
    songpath = path;
    notifyListeners();
  }

  void loadaudio() {
    assetsAudioPlayer.open(
      Audio("$songpath"),
      showNotification: true,
      autoStart: false,
    );
    totalDuration();
  }

  void totalDuration() {
    assetsAudioPlayer.current.listen((event) {
      songDuration = event!.audio.duration;
    });
  }
}
