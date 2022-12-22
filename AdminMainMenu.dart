import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hilytest/services/auth.dart';

class AdminMainMenu extends StatefulWidget {
  @override
  _AdminMainMenuState createState() => _AdminMainMenuState();
}

class _AdminMainMenuState extends State<AdminMainMenu> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("           ADMIN MAIN MENU"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Colors.brown[300],
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: AssetImage("images/bg.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                  child: Text(
                    "Jadual Bilal dan Imam ",
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ), //font size
                  onPressed: () {
                    Navigator.pushNamed(context, '/JadBilalAdmin');
                  },
                  color: Colors.brown[800],
                  textColor: Colors.pink[50],
                  padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text(
                    "Jadual Tetamu Jemputan ",
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ), //font size
                  onPressed: () {
                    Navigator.pushNamed(context, '/JadSGAdmin');
                  },
                  color: Colors.brown[800],
                  textColor: Colors.pink[50],
                  padding: EdgeInsets.fromLTRB(55, 20, 55, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text(
                    "Jadual Aktiviti Masjid ",
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ), //font size
                  onPressed: () {
                    Navigator.pushNamed(context, '/JadActAdmin');
                  },
                  color: Colors.brown[800],
                  textColor: Colors.pink[50],
                  padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text(
                    "Aduan dan Cadangan Pengguna ",
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ), //font size
                  onPressed: () {
                    Navigator.pushNamed(context, '/AdminComplain');
                  },
                  color: Colors.brown[800],
                  textColor: Colors.pink[50],
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text(
                    "Log Keluar",
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ), //font size
                  onPressed: () {
                    Navigator.pushNamed(context, '/LoginChoose');
                  },
                  color: Colors.brown[800],
                  textColor: Colors.pink[50],
                  padding: EdgeInsets.fromLTRB(110, 20, 119, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              SizedBox(
                height: 20,
              ),

              // child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       StreamBuilder(
              //         stream:
              //             FirebaseFirestore.instance.collection("users").snapshots(),
              //         builder: (BuildContext context,
              //             AsyncSnapshot<QuerySnapshot> snapshot) {
              //           if (snapshot.hasData && snapshot.data != null) {
              //             final docs = snapshot.data.docs;
              //             return ListView.builder(
              //               shrinkWrap: true,
              //               physics: NeverScrollableScrollPhysics(),
              //               itemCount: docs.length,
              //               itemBuilder: (BuildContext context, int index) {
              //                 final user = docs[index].data();
              //                 return ListTile(
              //                   title: Text(user['name'] ?? user['email']),
              //                 );
              //               },
              //             );
              //           } else {
              //             return Center(
              //               child: CircularProgressIndicator(),
              //             );
              //           }
              //         },
              //       ),
            ]),
      ),
    );
  }
}
