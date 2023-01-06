import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vlc_player/screens/BottomNavigation/view/BottomNavigation.dart';
import 'package:vlc_player/screens/Home/provider/HomeProvider.dart';
import 'package:vlc_player/screens/Home/view/HomePage.dart';
import 'package:vlc_player/screens/audio/provider/AudioProvider.dart';
import 'package:vlc_player/screens/audio/view/AudioPage.dart';
import 'package:vlc_player/screens/audio/view/AudioShowPage.dart';

import 'screens/videos/view/videoPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(
          create: (context) => audioProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Bottom(),
          'V': (context) => VideoPage(),
          'H': (context) => HomePage(),
          'A': (context) => AudioPage(),
          'AS': (context) => AudioShowPage(),
        },
      ),
    ),
  );
}
