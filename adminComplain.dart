import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminComplain extends StatefulWidget {
  @override
  _AdminComplainState createState() => _AdminComplainState();
}

class _AdminComplainState extends State<AdminComplain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aduan Pengguna"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Berikut merupakan senarai aduan dan cadangan pengguna",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 20),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("usercomplain")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot documentSnapshot =
                                  snapshot.data.documents[index];
                              return Container(
                                color: Colors.blue[50],
                                child: ListTile(
                                  title: Text(documentSnapshot["complain"]),
                                  //trailing: Icon(Icons.rotate_right),
                                ),
                              );
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
