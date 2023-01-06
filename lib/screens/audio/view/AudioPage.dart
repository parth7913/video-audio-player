import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vlc_player/screens/audio/provider/AudioProvider.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
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
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Audio Player",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: providerFalse!.audioList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset("${providerFalse!.audioList[index].image}"),
              title: Text("${providerFalse!.audioList[index].name}"),
              subtitle: Text("${providerFalse!.audioList[index].subname}"),
              trailing: IconButton(
                onPressed: () {
                  providerFalse!.isPlay
                      ? providerFalse!.assetsAudioPlayer.pause()
                      : providerFalse!.assetsAudioPlayer.play();

                  providerFalse!.Data(providerFalse!.audioList[index]);
                  providerFalse!.Path(providerFalse!.a1!.audio);
                  providerFalse!.loadaudio();
                  if (providerTrue!.audioList[index].play!) {
                    providerTrue!.assetsAudioPlayer.pause();
                  } else {
                    providerTrue!.assetsAudioPlayer.play();
                  }
                  providerFalse!.changePlay(false, index);
                  Navigator.pushNamed(context, 'AS');
                },
                icon: Icon(
                  Icons.play_circle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
