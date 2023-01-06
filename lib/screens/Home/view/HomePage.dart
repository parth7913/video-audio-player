import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vlc_player/screens/Home/provider/HomeProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider? providerTrue;
  HomeProvider? providerFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).loadVideo();
  }

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<HomeProvider>(context, listen: true);
    providerFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("${providerFalse!.H1!.name}"),
        ),
        body: Chewie(
          controller: providerTrue!.chewieController!,
        ),
      ),
    );
  }

  @override
  void dispose() {
    providerFalse!.chewieController!.pause();
    super.dispose();
  }
}
