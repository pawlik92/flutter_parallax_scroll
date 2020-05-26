import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_parallax_scroll/screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Parallax Scroll',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
