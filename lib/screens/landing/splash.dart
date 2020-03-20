import 'dart:async';

import 'package:covid/screens/landing/landing.dart';
import 'file:///C:/Users/Acer/Desktop/covid/lib/screens/landing/language_choose.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {



  Future Loading() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool _seen = (pref.getBool('seen')?? true);

    if (_seen == false) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new OnBoardingScreen()));
    } else{
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new ChooseLang()));
      pref.setBool('seen', true);
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    new Timer(new Duration(milliseconds: 1000), () {
      Loading();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator()
        ),
      ),
    );
  }
}
