import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hilytest/services/auth.dart';
import 'package:url_launcher/url_launcher.dart';

class GuestMenu extends StatefulWidget {
  @override
  _GuestMenuState createState() => _GuestMenuState();
}

class _GuestMenuState extends State<GuestMenu> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Menu Utama"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("images/mk.jpg"), fit: BoxFit.cover)),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 80,
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                          "Masjid Khalifah terletak di Jalan Pusara atau Jalan Kamaruddin di Terengganu, masjid ini mampu memuatkan sekitar seribu orang jemaah"),
                    ),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      height: 80,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellow,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),

                        //child: Text(
                        //  "Sekarang anda boleh mengetahui menonton live di Facebook"),
                        child: GestureDetector(
                          child: Text(
                              "Tekan disini untuk menonton live Facebook",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue)),
                          onTap: () {
                            launch(
                                'https://www.facebook.com/masjidkhalifahtrg/');
                          },
                        ),
                      )),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 80,
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                          "Hubungi kami:                                                No.telefon: 012-989-5567                                       Email: masjidkhalifah.trg@gmail.com Facebook:masjidkhalifah@masjidkhalifahtrg"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50.0,
                ),
              ),
              accountName: Text(''),
              accountEmail: Text(''),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.border_color,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              title: Text('Aduan dan Cadangan'),
              onTap: () {
                Navigator.pushNamed(context, '/ComplainQuestion');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.event_note,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              title: Text('Jadual Imam dan Bilal'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/JadualBilal');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.directions_run,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              title: Text('Aktiviti Masjid'),
              onTap: () {
                Navigator.pushNamed(context, '/SignUpPage');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.perm_contact_calendar,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              title: Text('Jadual Penceramah Jemputan'),
              onTap: () {
                Navigator.pushNamed(context, '/SignUpPage');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.logout,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              title: Text('Log Keluar'),
              onTap: () {
                AuthHelper.logOut();
                Navigator.pushNamed(context, '/LoginChoose');
              },
            ),
          ],
        ),
      ),
    );
  }
}
