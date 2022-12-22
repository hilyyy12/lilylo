import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JadualBilal extends StatefulWidget {
  @override
  _JadualBilalState createState() => _JadualBilalState();
}

class _JadualBilalState extends State<JadualBilal> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Jadual Imam dan Bilal"),
      ),
      body: Column(
        //scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
           Text(
                "Jadual Imam dan Bilal bagi Bulan Oktober",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              SizedBox(
            height: 20,
          ),
           Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Expanded(child: Text("Hari",style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Tarikh",style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Nama Imam",style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Nama Bilal",style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                      //Expanded(child: Text("Action")),
                    ],
                  ),
                ),
          StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("jadualimambilal")
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
                                child: Text(documentSnapshot["hariTugas"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["tarikhTugas"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["imamName"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["bilalName"]),
                              ),
                              //      Expanded(
                              //        new IconButton(
                              //     icon: const Icon(Icons.delete_forever,
                              //         color: const Color(0xFF167F67)),
                              //      onPressed: () {
                              //   deleteData();
                              //   dispose
                              // },
                              // alignment: Alignment.centerLeft,
                            ]);
                          });
              } else {
                return Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
