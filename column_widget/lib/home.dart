import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column Widget"),
      ),
      // wrap body inside container widget
      body: Container(
        child: Column(
          // column widget expect an array of widget to show on column
          children: <Widget>[
            // first element of widget array
            Container(
              margin: EdgeInsets.all(20.0),
              child: Text(
                "Main Header",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            // second element of widget array
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                "Sub Header",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            // third element of widget array
            Container(
              margin: EdgeInsets.all(20.0),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."),
            ),
          ],
        ),
      ),
    );
  }
}
