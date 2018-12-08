import 'package:flutter/material.dart';

void main() => runApp(

  MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Hello World",
    home: Scaffold(
      appBar: AppBar(title: Text("Hello World App"),),
      body: Material(
        child: Center(
          child: Text(
            "Hello World!",
            style: TextStyle(fontSize: 40.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  )
);
