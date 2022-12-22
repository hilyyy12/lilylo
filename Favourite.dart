import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var clients = [];
  var clientsToggle = false;

  @override
  void initState() {
    clients = [];
    clientsToggle = false;
                      final User user = auth.currentUser;
                      final uid = user.uid;
      Firestore.instance
          .collection('users')
                      .document(uid)
                      .collection('liked')
          .getDocuments()
          .then((docs) {
        if (docs.documents.isNotEmpty) {
          // setState(() {
          //   clientsToggle = true;
          // });
          for (int i = 0; i < docs.documents.length; ++i) {
            print('test2');
            print(docs.documents[i].documentID);
            Firestore.instance
                .collection('jadualaktiviti')
                .document(docs.documents[i].documentID.toString())
                .get()
                .then((review) {
                  if(review.exists){
                    clients.add(review.data());
                  }
                  print('test1');
            //   if (!review.empty) {
            //     print(review);
            // clients.add(review.data());
            //   }
            
                if (clients.length == docs.documents.length) {
                  print(clients);
                  setState(() {
                    clientsToggle = true;
                  });
                }
            });
          }
        }
      });
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
      ),
      body: Column(
        //scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 10),
              clientsToggle 
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: clients.length,
                    itemBuilder: (context, index) {
                      var alreadySaved = true;
                      var documentSnapshot =
                          clients[index];
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
                        // trailing: new Icon(
                        //   alreadySaved ? Icons.favorite : Icons.favorite_border,
                        //   color: alreadySaved ? Colors.red : null,
                        // ),
                        onTap: (){}
                      );
                    })
              
                // return null;
                :Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
