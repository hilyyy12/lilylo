import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JadActAdmin extends StatefulWidget {
  @override
  _JadActAdminState createState() => _JadActAdminState();
}

class _JadActAdminState extends State<JadActAdmin> {
  String namaAktiviti, tarikhAktiviti, tempatAktiviti;

  getNamaAktiviti(namaact) {
    this.namaAktiviti = namaact;
  }

  getTarikhAktiviti(dateact) {
    this.tarikhAktiviti = dateact;
  }

  getTempatAktiviti(tempatact) {
    this.tempatAktiviti = tempatact;
  }

  createData() {
    print("created");
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("jadualaktiviti")
        .doc(namaAktiviti);

    Map<String, dynamic> aktiviti = {
      "namaAktiviti": namaAktiviti,
      "tarikhAktiviti": tarikhAktiviti,
      "tempatAktiviti": tempatAktiviti,
    };
    documentReference.set(aktiviti).whenComplete(() {
      print("$namaAktiviti created");
    });
  }

  readData() {
    print("created");
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("jadualaktiviti")
        .doc(namaAktiviti);

    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data()["namaAktiviti"]);
      print(datasnapshot.data()["tarikhAktiviti"]);
      print(datasnapshot.data()["tempatAktiviti"]);
    });
  }

  updateData() {
    print("created");
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("jadualaktiviti")
        .doc(namaAktiviti);

    Map<String, dynamic> aktiviti = {
      "namaAktiviti": namaAktiviti,
      "tarikhAktiviti": tarikhAktiviti,
      "tempatAktiviti": tempatAktiviti,
    };
    documentReference.set(aktiviti).whenComplete(() {
      print("$namaAktiviti updated");
    });
  }

  deleteData() {
    print("created");
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("jadualaktiviti")
        .doc(namaAktiviti);

    documentReference.delete().whenComplete(() {
      print("$namaAktiviti deleted");
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
        title: Text("Aktiviti Masjid"),
      ),
      body: Container(
        child: new SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Nama Aktiviti",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0))),
                      onChanged: (String namaact) {
                        getNamaAktiviti(namaact);
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
                      onChanged: (String dateact) {
                        getTarikhAktiviti(dateact);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Tempat",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0))),
                      onChanged: (String tempatact) {
                        getTempatAktiviti(tempatact);
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
                      //   color: Colors.grey,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(16),
                      //   ),
                      //   child: Text("Read"),
                      //   textColor: Colors.blue,
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
                    ]),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("jadualaktiviti")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data.documents[index];
                            return ListTile(
                              //alignment: Alignment.centerLeft,
                              title: Text(documentSnapshot["namaAktiviti"]),
                              subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(documentSnapshot["tarikhAktiviti"]),
                                    Text(documentSnapshot["tempatAktiviti"]),
                                  ]),
                              onTap: () {
                                delete(context);
                              },
                              trailing: Icon(Icons.delete),
                            );
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

  void delete(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
          title: Text("Buang Aktiviti ?"),
          content: Text('Nama Aktiviti'),
          actions: [
            FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  deleteData();
                  Navigator.pop(context);
                }),
            FlatButton(
                child: Text('No'), onPressed: () => Navigator.pop(context))
          ]),
    );
  }
}
