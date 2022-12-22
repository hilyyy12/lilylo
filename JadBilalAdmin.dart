import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JadBilalAdmin extends StatefulWidget {
  @override
  _JadBilalAdminState createState() => _JadBilalAdminState();
}

class _JadBilalAdminState extends State<JadBilalAdmin> {
  String hariTugas, tarikhTugas, imamName, bilalName;

  getHariBertugas(haritugas) {
    this.hariTugas = haritugas;
  }

  getTarikhBertugas(datetugas) {
    this.tarikhTugas = datetugas;
  }

  getImamName(imamname) {
    this.imamName = imamname;
  }

  getBilalName(bilalname) {
    this.bilalName = bilalname;
  }

  createData() {
    print("created");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("jadualimambilal").doc(hariTugas);

    Map<String, dynamic> jadualimam = {
      "hariTugas": hariTugas,
      "tarikhTugas": tarikhTugas,
      "imamName": imamName,
      "bilalName": bilalName,
    };
    documentReference.set(jadualimam).whenComplete(() {
      print("$hariTugas created");
    });
  }

  readData() {
    print("created");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("jadualimambilal").doc(hariTugas);

    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data()["hariTugas"]);
      print(datasnapshot.data()["tarikhTugas"]);
      print(datasnapshot.data()["imamName"]);
      print(datasnapshot.data()["bilalName"]);
    });
  }

  updateData() {
    print("created");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("jadualimambilal").doc(hariTugas);

    Map<String, dynamic> jadualimam = {
      "hariTugas": hariTugas,
      "tarikhTugas": tarikhTugas,
      "imamName": imamName,
      "bilalName": bilalName,
    };
    documentReference.set(jadualimam).whenComplete(() {
      print("$hariTugas created");
    });
  }

  deleteData() {
    print("created");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("jadualimambilal").doc(hariTugas);

    documentReference.delete().whenComplete(() {
      print("$hariTugas deleted");
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
        title: Text("Jadual Bilal & Imam"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Hari",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0))),
                      onChanged: (String haritugas) {
                        getHariBertugas(haritugas);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Tarikh",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0))),
                      onChanged: (String tarikhtugas) {
                        getTarikhBertugas(tarikhtugas);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Nama Imam",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0))),
                      onChanged: (String imamname) {
                        getImamName(imamname);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Nama Bilal",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0))),
                      onChanged: (String bilalname) {
                        getBilalName(bilalname);
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
                      //   color: Colors.brown,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(16),
                      //   ),
                      //   child: Text("Read"),
                      //   textColor: Colors.white,
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
                      Expanded(child: Text("Hari")),
                      Expanded(child: Text("Tarikh")),
                      Expanded(child: Text("Nama Imam")),
                      Expanded(child: Text("Nama Bilal")),
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
              ]),
        ),
      ),
    );
  }
}
