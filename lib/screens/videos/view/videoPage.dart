import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vlc_player/screens/Home/provider/HomeProvider.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  HomeProvider? providerTrue;
  HomeProvider? providerFalse;

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<HomeProvider>(context, listen: true);
    providerFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Video Player",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: providerFalse!.imageList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  providerFalse!.H1 = providerTrue!.imageList[index];
                  Navigator.pushNamed(context, 'H');
                },
                child: Container(
                  height: 200,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          "${providerFalse!.imageList[index].image}"),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
