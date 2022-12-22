import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:english_words/english_words.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JadualActivity extends StatefulWidget {
  @override
  _JadualActivityState createState() => _JadualActivityState();
}

class _JadualActivityState extends State<JadualActivity> {
  //final Set<WordPair> _saved = new Set<WordPair>();
final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final bool alreadySaved = _saved.contains(WordPair);

    return Scaffold(
      appBar: AppBar(
        title: Text("Aktiviti Masjid"),
      ),
      body: Column(
        //scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 10),
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
                      var alreadySaved = true;
                      DocumentSnapshot documentSnapshot =
                          snapshot.data.documents[index];
                      final User user = auth.currentUser;
                      final uid = user.uid;
                      final refer = Firestore.instance
                      .collection('users')
                      .document(uid)
                      .collection('liked');
                      final snapShot = refer.document(documentSnapshot.reference.documentID).get();
                      print(snapShot);
                      snapShot.then((dc){
                      if(dc.exists){
                        print("ada");
                        alreadySaved = true;
                      }else{
                        alreadySaved = false;
                        print("tkda");
                      }
                      });
                    // if (snapShot == null || !snapShot.exists) {
                    //   // Document with id == docId doesn't exist.
                    // }
                      return ListTile(
                        title: Text(documentSnapshot["namaAktiviti"]),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(documentSnapshot["tarikhAktiviti"]),
                              Text(documentSnapshot["tempatAktiviti"]),
                            ]),
                        trailing: new Icon(
                          alreadySaved ? Icons.favorite : Icons.favorite_border,
                          color: alreadySaved ? Colors.red : null,
                        ),
                        onTap: (){
                          if(alreadySaved){
                          refer.document(documentSnapshot.reference.documentID).delete().whenComplete((){
                            alreadySaved = false;
                        //   FirebaseFirestore.instance
                        // .collection("jadualaktiviti")
                        // .document(documentSnapshot.reference.documentID)
                        // .collection("Click")
                        // .document(documentSnapshot.reference.documentID)
                        // .set({"clicked": 1}).whenComplete((){
                        //   print(documentSnapshot.reference.documentID);
                        //   });
                          });
                          }else{
                          refer.document(documentSnapshot.reference.documentID).set({"liked": 1}).whenComplete((){
                            alreadySaved = true;
                        //   FirebaseFirestore.instance
                        // .collection("jadualaktiviti")
                        // .document(documentSnapshot.reference.documentID)
                        // .collection("Click")
                        // .document(documentSnapshot.reference.documentID)
                        // .set({"clicked": 1}).whenComplete((){
                        //   print(documentSnapshot.reference.documentID);
                        //   });
                          });
                        }
                            print(alreadySaved);}
                      );
                    });
              } else {
                // return null;
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
