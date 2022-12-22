import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'GuestMenu.dart';

class LoginChoose extends StatefulWidget {
  @override
  _LoginChooseState createState() => _LoginChooseState();
}

class _LoginChooseState extends State<LoginChoose> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/mk.jpg"), fit: BoxFit.cover)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "MY MASJID KHALIFAH ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 60,
              ),
              RaisedButton(
                  child: Text(
                    "Log Masuk ",
                    style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                  ), //font size
                  onPressed: () {
                    Navigator.pushNamed(context, '/Login');
                  },
                  color: Colors.yellow,
                  textColor: Colors.black,
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text(
                    "Paparan Umum",
                    style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                  ), //font size
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GuestMenu()),
                    );
                  },
                  color: Colors.yellow,
                  textColor: Colors.black,
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))
            ]),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods
  }
}
