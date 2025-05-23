import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watchlist_media/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

// -> USE PROVIDER FOR STATE MANAGEMENT
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // IT CHANGED NA????
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: IntroPage(),

    );
  }
}

