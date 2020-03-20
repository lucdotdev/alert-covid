import 'package:covid/screens/landing/landing.dart';
import 'package:covid/utils/lang.dart';
import 'package:flutter/material.dart';

enum Lanquage { Fr, Ln, Tsh, Kik, Swa, En}

class ChooseLang extends StatefulWidget {
  @override
  _ChooseLangState createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  Lanquage _character = Lanquage.Fr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: <Widget>[
                Text(
                    'Alert',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: 10,),

                Text(
                  'Covid !',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          Center(
            child: Card(
              elevation: 3,
              child: Column(
                children: <Widget>[
                  Text(
                    'Selectionner votre langue',
                    style: TextStyle(
                        fontSize: width / 20, fontWeight: FontWeight.bold),
                  ),

                  RadioListTile(
                    title: const Text('Français'),
                    value: Lanquage.Fr,
                    groupValue: _character,
                    onChanged: (Lanquage value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),

                  RadioListTile(
                    title: const Text('Swahili'),
                    value: Lanquage.Swa,
                    groupValue: _character,
                    onChanged: (Lanquage value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('English'),
                    value: Lanquage.En,
                    groupValue: _character,
                    onChanged: (Lanquage value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),

                  Container(
                    width: width / 3,
                    child: FlatButton(
                        onPressed: () async {
                          await allTranslations.setNewLanguage(
                              _character.toString().substring(9));
                          setState(() {});
                          Navigator.of(context).pushReplacement(
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      new OnBoardingScreen()));
                        },
                        color: Colors.blueAccent,
                        child: Row(
                          children: <Widget>[
                            new Text(
                              'Continuer',
                              style: TextStyle(color: Colors.white),
                            ),
                            new Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
