import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lupa Kata Laluan"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: editController,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Masukkan Email",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.deepOrange[300],
                onPressed: () {
                  resetPassword(context);
                },
                child: Text(
                  "Ubah Suai Kata Laluan",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  
                ),
                padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
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
