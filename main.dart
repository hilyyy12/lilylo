import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hilytest/AdminMainMenu.dart';
import 'package:hilytest/ComplainQuestion.dart';
import 'package:hilytest/Favourite.dart';
import 'package:hilytest/GuestMenu.dart';
import 'package:hilytest/JadActAdmin.dart';
import 'package:hilytest/JadBilalAdmin.dart';
import 'package:hilytest/JadualActivity.dart';
import 'package:hilytest/JadualBilal.dart';
import 'package:hilytest/JadualSG.dart';
import 'package:hilytest/LoginChoose.dart';
import 'package:hilytest/MainMenu.dart';
import 'package:hilytest/SetProfile.dart';
import 'package:hilytest/JadSGAdmin.dart';
import 'package:hilytest/SignUpPage.dart';
import 'package:hilytest/adminComplain.dart';
import 'package:hilytest/services/auth.dart';
import 'package:hilytest/slidee.dart';
import 'UserLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/LoginChoose': (context) => LoginChoose(), //page
        '/MainMenu': (context) => MainMenu(), //page
        '/Login': (context) => UserLogin(),
        '/AdminComplain': (context) => AdminComplain(),
        '/SetProfile': (context) => SetProfile(),
        '/SignUpPage': (context) => SignUpPage(),
        '/JadualBilal': (context) => JadualBilal(),
        '/JadualSG': (context) => JadualSG(),
        '/JadualActivity': (context) => JadualActivity(),
        '/ComplainQuestion': (context) => ComplainQuestion(),
        '/Favourite': (context) => Favourite(),
        '/GuestMenu': (context) => GuestMenu(),
        '/JadSGAdmin': (context) => JadualSGAdmin(),
        '/JadActAdmin': (context) => JadActAdmin(),
        '/JadBilalAdmin': (context) => JadBilalAdmin(),
        '/AdminMainMenu': (context) => AdminMainMenu(),

        //'/Wrapper': (context) => Wrapper(),
      },
      title: 'Flutter Demo Masjid',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Slidee(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  // final String title;

  // @override
  //_MyHomePageState createState() => _MyHomePageState();

//class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            UserHelper.saveUser(snapshot.data);
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(snapshot.data.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final userDoc = snapshot.data;
                  final user = userDoc.data();
                  print(user);
                  if (user["role"] == 'admin') {
                    return AdminMainMenu();
                  } else {
                    return MainMenu();
                  }
                } else {
                  return Material(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }
          return UserLogin();
        });
  }
}
