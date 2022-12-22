import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SetProfile extends StatefulWidget {
  @override
  _SetProfileState createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  TextEditingController editController = TextEditingController();
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tetapan"),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Sila masukkan email untuk menukar kata laluan anda"),
            SizedBox(height: 20),
            TextField(
              controller: editController,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter Email",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.yellow,
                onPressed: () {
                  resetPassword(context);
                },
                child: Text(
                  "Tukar Kata Laluan",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void resetPassword(BuildContext context) async {
    if (editController.text.length == 0 || !editController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Enter valid email");
      return;
    }

    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: editController.text);
    Fluttertoast.showToast(
        msg:
            "Reset password link has sent your mail please use it to change the password.");
    Navigator.pop(context);
  }
}
