import 'package:flutter/material.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Container Widget"),
      ),
      body: Center(
        child: Container(
          width: 200.0,
          height: 100.0,
          color: Colors.green,
          child: Text(
              "Container",
              style: TextStyle(fontSize: 40.0,),
              textAlign: TextAlign.center,
          ),
        ),
      ),
    );

  }

}
