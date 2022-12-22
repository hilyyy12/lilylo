import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JadualSGAdmin extends StatefulWidget {
  @override
  _JadualSGAdminState createState() => _JadualSGAdminState();
}

class _JadualSGAdminState extends State<JadualSGAdmin> {
  String tarikhCeramah, timeCeramah, namaCeramah, tajukCeramah;

  gettarikhceramah(cdate) {
    this.tarikhCeramah = cdate;
  }

  gettimeCeramah(ctime) {
    this.timeCeramah = ctime;
  }

  getnamaCeramah(cname) {
    this.namaCeramah = cname;
  }

  gettajukCeramah(ctitle) {
    this.tajukCeramah = ctitle;
  }

  createData() {
    print("created");
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("jadualpenceramah")
        .doc(namaCeramah);

    Map<String, dynamic> ceramah = {
      "tarikhCeramah": tarikhCeramah,
      "timeCeramah": timeCeramah,
      "namaCeramah": namaCeramah,
      "tajukCeramah": tajukCeramah,
    };
    documentReference.set(ceramah).whenComplete(() {
      print("$namaCeramah created");
    });
  }

  readData() {
    print("created");
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("jadualpenceramah")
        .doc(namaCeramah);

    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data()["tarikhCeramah"]);
      print(datasnapshot.data()["timeCeramah"]);
      print(datasnapshot.data()["namaCeramah"]);
      print(datasnapshot.data()["tajukCeramah"]);
    });
  }

  updateData() {
    print("created");
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("jadualpenceramah")
        .doc(namaCeramah);

    Map<String, dynamic> ceramah = {
      "tarikhCeramah": tarikhCeramah,
      "timeCeramah": timeCeramah,
      "namaCeramah": namaCeramah,
      "tajukCeramah": tajukCeramah,
    };
    documentReference.set(ceramah).whenComplete(() {
      print("$namaCeramah updated");
    });
  }

  deleteData() {
    print("created");
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("jadualpenceramah")
        .doc(namaCeramah);

    documentReference.delete().whenComplete(() {
      print("$namaCeramah deleted");
    });
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tetamu Undangan"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Tarikh",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0))),
                      onChanged: (String cdate) {
                        gettarikhceramah(cdate);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Waktu",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0))),
                      onChanged: (String ctime) {
                        gettimeCeramah(ctime);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Nama Penceramah",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0))),
                      onChanged: (String cname) {
                        getnamaCeramah(cname);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Tajuk Ceramah",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0))),
                      onChanged: (String ctitle) {
                        gettajukCeramah(ctitle);
                      }),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text("Create"),
                        textColor: Colors.white,
                        onPressed: () {
                          createData();
                        },
                      ),
                      // RaisedButton(
                      //   color: Colors.blue,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(16),
                      //   ),
                      //   child: Text("Read"),
                      //   textColor: Colors.pink,
                      //   onPressed: () {
                      //     readData();
                      //   },
                      // ),
                      RaisedButton(
                        color: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text("Update"),
                        textColor: Colors.white,
                        onPressed: () {
                          updateData();
                        },
                      ),
                      RaisedButton(
                        color: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text("Delete"),
                        textColor: Colors.white,
                        onPressed: () {
                          deleteData();
                        },
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Expanded(child: Text("Tarikh")),
                      Expanded(child: Text("Waktu")),
                      Expanded(child: Text("Nama")),
                      Expanded(child: Text("Tajuk")),
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
              ]),
        ),
      ),
    );
  }
}
