import 'package:flutter/material.dart';

void main() => runApp( MainScreen() );


class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Stateless Widget",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateless Widget"),
        ),
        body: Material(
          child: Center(
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Stateless widget that does not have any state, it's always static",
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
            )

          ),
        ),
      ),

    );
  }


}
