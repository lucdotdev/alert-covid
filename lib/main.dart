                                                                                        
import 'package:covid/screens/landing/splash.dart';
import 'package:flutter/material.dart';

void main() {
  // then start the application
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(


        primarySwatch: Colors.blue,

      ),
      home: Splash()
    );
  }
}


