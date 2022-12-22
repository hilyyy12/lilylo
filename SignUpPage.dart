import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hilytest/services/auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //FirebaseAuth _auth = FirebaseAuth.instance;
  String _name;
  String _email;
  String _pass;
  String _conpass;
  final _formKey = GlobalKey<FormState>();
  TextEditingController username;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController confirmpasswordcontroller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    username = TextEditingController(text: "");
    emailController = TextEditingController(text: "");
    passwordController = TextEditingController(text: "");
    confirmpasswordcontroller = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/mk.jpg"), fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                height: 400,
                width: 300,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Daftar Akaun ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                        ),
                        validator: (String username) {
                          if (username.isEmpty) {
                            return 'masukkan username';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                        validator: (String emailController) {
                          if (emailController.isEmpty) {
                            return 'masukkan email yang sah';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Kata Laluan',
                        ),
                        validator: (String passwordController) {
                          if (passwordController.isEmpty) {
                            return 'kata laluan diperlukan';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: confirmpasswordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Sahkan Semula Kata Laluan',
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (String confirmpasswordcontroller) {
                          if (confirmpasswordcontroller.isEmpty) {
                            return 'sila sahkan semula kata laluan';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      color: Colors.yellow,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                      child: Text("Daftar"),
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        print(_name);
                        print(_email);
                        print(_pass);
                        print(_conpass);
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          print("Email and password cannot be empty");
                          return;
                        }
                        if (confirmpasswordcontroller.text.isEmpty ||
                            passwordController.text !=
                                confirmpasswordcontroller.text) {
                          print("confirm password does not match");
                          return;
                        }
                        try {
                          final user = await AuthHelper.signupWithEmail(
                              email: emailController.text,
                              password: passwordController.text);
                          if (user != null) {
                            await UserHelper.saveUser(user);
                            print("signup successful");
                            Navigator.pop(context);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Sudah mempunyai akaun ? "),
                          Text(
                            "Log masuk",
                            style: TextStyle(color: Color(0xff6bceff)),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/Login');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void dispose() {
    username.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }
}
