import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Row Widget"),
      ),
      body: Container(
        // add margin on top of 50.0
        margin: EdgeInsets.only(top: 50.0),
        // Row widget
        child: Row(
          // Row widget expect an array of children widgets
          children: <Widget>[
            // first element of widget array - Expanded widget expand the text if its too long
            Expanded(
              child: Text(
                "First",
                style: TextStyle(fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
            // second element of widget array
            Expanded(
              child: Text(
                "Second",
                style: TextStyle(fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
            // third element of widget array
            Expanded(
              child: Text(
                "Third",
                style: TextStyle(fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
