import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vlc_player/screens/audio/provider/AudioProvider.dart';

class AudioShowPage extends StatefulWidget {
  const AudioShowPage({Key? key}) : super(key: key);

  @override
  State<AudioShowPage> createState() => _AudioShowPageState();
}

class _AudioShowPageState extends State<AudioShowPage> {
  audioProvider? providerTrue;
  audioProvider? providerFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<audioProvider>(context, listen: false).loadaudio();
  }

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<audioProvider>(context, listen: true);
    providerFalse = Provider.of<audioProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Now Playing",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Container(
                height: double.infinity,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage("${providerFalse!.a1!.image}"),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              color: Colors.black87,
            ),
            PlayerBuilder.currentPosition(
              player: providerFalse!.assetsAudioPlayer,
              builder: (context, position) =>
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 280,
                        width: 280,
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage("${providerFalse!.a1!.image}"),
                        ),
                      ),
                      Text(
                        "${providerFalse!.a1!.name}",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        "${providerFalse!.a1!.subname}",
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              providerFalse!.changestop(!providerFalse!.a1!
                                  .Astop!,
                                  providerFalse!.a1!.ind);
                              providerFalse!.a1!.Astop!
                                  ? providerFalse!.assetsAudioPlayer.stop()
                                  : providerFalse!.assetsAudioPlayer.play();
                            },
                            icon: Icon(providerTrue!.a1!.Astop!? Icons
                                .stop_circle:Icons.play_circle,
                                color: Colors.white, size: 25),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            onPressed: () {
                              providerFalse!.changePlay(!providerFalse!.a1!
                                  .play!,
                                  providerFalse!.a1!.ind);
                              providerFalse!.a1!.play!
                                  ? providerFalse!.assetsAudioPlayer.pause()
                                  : providerFalse!.assetsAudioPlayer.play();
                            },
                            icon: Icon(
                                providerTrue!.a1!.play!
                                    ? Icons.play_circle
                                    : Icons.pause_circle,
                                color: Colors.white,
                                size: 35),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          IconButton(
                            onPressed: () {
                              providerFalse!.changeAhead(!providerFalse!.a1!
                                  .Ahead!,
                                  providerFalse!.a1!.ind);
                              providerFalse!.a1!.Ahead!
                                  ? providerFalse!.assetsAudioPlayer.setVolume(
                                  0)
                                  : providerFalse!.assetsAudioPlayer.setVolume(
                                  100);
                            },
                            icon: Icon(
                                providerTrue!.a1!.Ahead!
                                    ? Icons.headset_off
                                    : Icons.headset,
                                color: Colors.white,
                                size: 25),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Slider(
                          activeColor: Colors.white,
                          value: position.inSeconds.toDouble(),
                          onChanged: (value) {
                            providerFalse!.assetsAudioPlayer
                                .seek(Duration(seconds: value.toInt()));
                          },
                          max: providerTrue!.songDuration.inSeconds.toDouble(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${position.inMinutes}:${position.inSeconds
                                  .remainder(60)}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${providerTrue!.songDuration
                                  .inMinutes}:${providerTrue!.songDuration
                                  .inSeconds.remainder(60)}",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    providerFalse!.assetsAudioPlayer.pause();
    super.deactivate();
  }
}
