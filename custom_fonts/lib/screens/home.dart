import 'package:flutter/material.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Fonts"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 400.0,
          height: 200.0,
          child: Text(
            "Montserrat Fonts",
            style: TextStyle(
              fontSize: 40.0,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }


}
