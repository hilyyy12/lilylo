import 'package:flutter/material.dart';
import 'package:hilytest/SignUpPage.dart';
import 'package:hilytest/services/auth.dart';

import 'AdminMainMenu.dart';
import 'MainMenu.dart';
import 'forgotpass.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: "");
    passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/mk.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 380,
              width: 300,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Log Masuk ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: 'Email',
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.black,
                        ),
                        hintText: 'Kata Laluan',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, right: 32),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ForgotPass(),
                              ));
                        },
                        child: Text(
                          'Lupa Kata Laluan?',
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    color: Colors.yellow,
                    padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text("Log Masuk"),
                    onPressed: () async {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        print("Email and password cannot be empty");
                        return;
                      }
                      try {
                        final user = await AuthHelper.signInWithEmail(
                            email: emailController.text,
                            password: passwordController.text);
                        if (user != null) {
                          print("login successful");
                          final value = await UserHelper.isAdmin(user.uid);
                          if (value == true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AdminMainMenu(),
                                ));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MainMenu(),
                                ));
                          }
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  RaisedButton(
                    color: Colors.yellow,
                    padding: EdgeInsets.fromLTRB(75, 10, 75, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text("Cipta Akaun"),
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SignUpPage(),
                          ));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
