import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid/utils/lang.dart';
import 'package:flutter/material.dart';



class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {




  final _formKey = GlobalKey<FormState>();
  String _name, _city, _tel;

  bool _symp1= false;
  bool _symp2= false;
  bool _symp3 = false;




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(allTranslations.text("home_button_2")),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Padding(

          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize:MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.start,

           children: <Widget>[


             Text(
               allTranslations.text("report_symp_title"),
               style: new TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20
               ),
             ),
             SizedBox(
               width: 60,
             ),
             Padding(
               padding: const EdgeInsets.only(top: 10),
               child: Column(
                 mainAxisSize:MainAxisSize.min,

                 children: <Widget>[

                   SizedBox(
                     width: 60,
                   ),
                     CustomCheck(
                       path: 'assets/img/flu.png',
                       title:  allTranslations.text("report_symp_1"),
                       value:  _symp1,
                       onChanged: (bool){
                         setState(() {
                           _symp1 =  !_symp1;

                         });
                       },
                     ),

                   SizedBox(
                     width: 60,
                   ),
                   CustomCheck(
                       path: 'assets/img/sore-throat.png',
                       title: allTranslations.text("report_symp_2"),
                     value: _symp2,
                     onChanged: (bool){
                       setState(() {
                         _symp2 = !_symp2;

                       });
                     },
                   ),
                   CustomCheck(
                       path: 'assets/img/fever.png',
                       title: allTranslations.text("report_symp_3"),
                     value: _symp3,
                     onChanged: (bool){
                       setState(() {
                         _symp3 = !_symp3;
                       });
                     },
                   ),


                 ],
               ),
             ),
             SizedBox(
               width: 60,
             ),
             Padding(
               padding: const EdgeInsets.only(top:10),
               child: Text(
                   allTranslations.text("report_inf_title"),
                 style: new TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                 ),

               ),
             ),
              Form(
                key: _formKey,
                  child: Column(
                    children: <Widget>[
                       TextFormField(
                        decoration: InputDecoration(
                            labelText:   allTranslations.text("report_inf_1"),),
                        onSaved: (input) => _name = input,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText:   allTranslations.text("report_inf_2"),
                        ),
                        onSaved: (input) => _city = input,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText:   allTranslations.text("report_inf_3"),
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (input) => _tel = input,
                      ),
                    ],
                  )
              ),
             SizedBox(),
             Center(
               child: Container(
                 width: width/3,
                 child: FlatButton(
                     onPressed: _submit,

                     color: Colors.blueAccent,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text( allTranslations.text(
                             "report_inf_send"),
                           style: TextStyle(
                             color: Colors.white
                           ),
                         ),
                         SizedBox(width: 4,),
                         Icon(
                             Icons.send,
                             color: Colors.white
                         )
                       ],
                     )),
               ),
             )
           ],
          ),
        ),
      ),
    );

  }
  _submit() async {

    Map<String, dynamic> data = {
      "name": _name,
      "city" : _city,
      "tel": _tel,
      "Symp": [
         _symp1, _symp2,_symp3
      ]

    };
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();

      await Firestore.instance.collection("cases").add(data).whenComplete(() => {});
      _showDialog();

  }
  }
  Future<void> _showDialog () async{
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext t) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            title: Text(
              allTranslations.text(
                  "report_inf_true"),
              style: new TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    allTranslations.text("report_inf_true_msg")
                ),
                Icon(
                  Icons.verified_user,
                  color: Colors.green,
                  size: 40,
                )
              ],
            ),
            actions: <Widget>[

              ///OUI
              ///
              ///
              Center(
                child: FlatButton(
                  child: Text('OK'),
                  color: Colors.white30,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        }
    );
  }

}






class CustomCheck extends StatefulWidget {
  final path;
  final title;
  final onChanged;
  final value;

  const CustomCheck({Key key, @required this.title, this.path,@required this.onChanged, this.value}) : super(key: key);

  @override
  _CustomCheckState createState() => _CustomCheckState();
}

class _CustomCheckState extends State<CustomCheck> {


  @override
  Widget build(BuildContext context) {


    return CheckboxListTile(
        title: Text(widget.title),
        value: widget.value,
      onChanged: widget.onChanged,
      secondary: Image.asset(widget.path),
    );
  }
}

