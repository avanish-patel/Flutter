import 'dart:math';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Lucky Nubmer",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lucky Nubmer"),
        ),
        body: Material(
          child: Center(
            child: Text(
              "Your Lucky Nubmer is : ${luckyNumberGenerator()}",
              style: TextStyle(fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }


  // random number generator function
  int luckyNumberGenerator() {

    var random = Random();
    int luckyNumber = random.nextInt(10);

    return luckyNumber;
  }

}