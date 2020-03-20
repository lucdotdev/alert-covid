import 'package:covid/utils/lang.dart';
import 'package:flutter/material.dart';
import '../home/home.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';


class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();

}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
      isShowSkipBtn: false,
      // Skip button

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),

      highlightColorDoneBtn: Color(0xff000000),

    );
  }

  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: allTranslations.text('tuto_title_1'),
        description: allTranslations.text('tuto_body_1'),
        pathImage: "assets/img/hand-wash.png",
        backgroundColor: Colors.blue,
      ),
    );
    slides.add(
      new Slide(
        title: allTranslations.text('tuto_title_2'),
        description: allTranslations.text('tuto_body_2'),
        pathImage: "assets/img/virus-transmission.png",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    slides.add(
      new Slide(
        title: allTranslations.text('tuto_title_3'),
        description: allTranslations.text('tuto_body_3'),
        pathImage: "assets/img/contageon.png",
        backgroundColor: Colors.red,
      ),
    );
  }

  void onDonePress() {
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => new HomePage()));
  }

  void onSkipPress() {
    // TODO: go to next screen
  }
  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
    );
  }



}
