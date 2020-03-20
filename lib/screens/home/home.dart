import 'package:covid/screens/home/information.dart';
import 'package:covid/screens/home/report.dart';
import 'package:covid/screens/landing/landing.dart';
import 'package:covid/utils/lang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;

    var Time = TimeOfDay.now().toString();

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,


      drawer:  Drawer(

        child: ListView(

          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Alert Covid',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Made with   ❤  ️by LucDotcom',
                    style: TextStyle(
                        color: Colors.white70
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.black,//Color.fromARGB(255, 0, 0, 120),

              ),
            ),

          ],
        ),
      ),
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed:() => _scaffoldKey.currentState.openDrawer(),
          icon: Icon(
              Icons.menu,
            color: Colors.black,
            size: 30,
          ),
        ),
        elevation: 0,
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text(
              int.parse(Time.substring(10,12)) < 17? allTranslations.text("salutation_1") : allTranslations.text("salutation_2"),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),

          MyCardIcon(
            title: allTranslations.text("home_button_1"),
            path: "assets/img/bacterium.png",
            width: width-10,
            heigth: heigth/6,
            firstColor: Color(0xff1959a9),
            lastColor: Color(0xff2872ba),
            redirect: InfoScreen(),
          ),

         MyCardIcon(
           title: allTranslations.text("home_button_2"),
           path: "assets/img/fever.png",
           width: width-10,
           heigth: heigth/6,
           firstColor: Colors.red,
           lastColor: Colors.redAccent,
           redirect: ReportScreen(),
         ),
          MyCardIcon(
            title: allTranslations.text("home_button_3"),
            path: "assets/img/flu.png",
            width: width-10,
            heigth: heigth/6,
            firstColor: Colors.orange,
            lastColor: Colors.orangeAccent,
            redirect: OnBoardingScreen(),
          ),




        ],
      ),
    );
  }
}


class MyCardIcon extends StatefulWidget {
  final title;
  final width;
  final heigth;
  final path;
  final firstColor;
  final lastColor;
  final redirect;
  MyCardIcon({
    @required this.title,
    @required this.width,
    @required this.path,
    @required this.heigth,
    @required this.firstColor,
    @required this.lastColor,
    @required this.redirect
  });

  @override
  _MyCardIconState createState() => _MyCardIconState();
}

class _MyCardIconState extends State<MyCardIcon> {
  @override
  Widget build(BuildContext context) {
    return

      GestureDetector(
        onTap: () => Navigator.push(context,  MaterialPageRoute(
            builder: (context) =>widget.redirect
        )),
        child: Center(
          child: Container(
            height: widget.heigth,
            width: widget.width,
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                        color: widget.firstColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                         widget.path
                      )
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.lastColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          topRight: Radius.circular(5)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                    widget.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

