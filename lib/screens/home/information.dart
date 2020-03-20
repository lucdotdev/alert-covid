import 'package:covid/utils/lang.dart';
import 'package:covid/utils/webview.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(allTranslations.text("home_button_1")),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: MyWebView(title: null, selectedUrl: "https://twitter.com/OMSRDCONGO")),
        ],
      ),
    );
  }
}
