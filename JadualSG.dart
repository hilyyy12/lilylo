import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JadualSG extends StatefulWidget {
  @override
  _JadualSGState createState() => _JadualSGState();
}

class _JadualSGState extends State<JadualSG> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jadual Tetamu Undangan"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 10),
           Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Expanded(child: Text("Tarikh",style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Waktu",style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Nama",style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Tajuk",style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                      // Expanded(child: Text("Buang")),
                    ],
                  ),
                ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("jadualpenceramah")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                          snapshot.data.documents[index];
                      return Row(children: <Widget>[
                              Expanded(
                                child: Text(documentSnapshot["tarikhCeramah"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["timeCeramah"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["namaCeramah"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["tajukCeramah"]),
                              ),
                            ]);
                          });
              } else {
                return Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: CircularProgressIndicator());
              }
            },
          ),
        ])),
      ),
    );
  }
}

