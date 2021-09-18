import 'package:flutter/material.dart';
import 'package:medic_app/pages/home/splashPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medic App',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
