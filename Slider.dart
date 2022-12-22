import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;

  SliderPage({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              description,
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 18,
                letterSpacing: 0.7,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
