import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ComplainQuestion extends StatefulWidget {
  @override
  _ComplainQuestionState createState() => _ComplainQuestionState();
}

class _ComplainQuestionState extends State<ComplainQuestion> {
  String complain;
  getFeedbackComplain(fcomp) {
    this.complain = fcomp;
  }

  createData() {
    print("created");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("usercomplain").doc();

    Map<String, dynamic> complaint = {
      "complain": complain,
    };

    documentReference.set(complaint).whenComplete(() {
      print("$complain created");
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
        title: Text("Aduan & Cadangan"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Isi borang dibawah jika anda mempunyai aduan atau saranan",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: Stack(children: <Widget>[
                  TextField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: "Sila nyatakan isu yang berlaku",
                        hintStyle:
                            TextStyle(fontSize: 13.0, color: Color(0xffc5c5c5)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffc5c5c5)),
                        ),
                      ),
                      onChanged: (String complain) {
                        getFeedbackComplain(complain);
                      }),
                ]),
              ),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: FlatButton(
                            onPressed: () {
                              if (complain != null) createData();
                              Fluttertoast.showToast(
                                  msg:
                                      "Aduan dan cadangan anda telah dihantar.");
                              Navigator.pop(context);
                            },
                            color: Colors.yellow,
                            child: Text(
                              "Hantar",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ))),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
