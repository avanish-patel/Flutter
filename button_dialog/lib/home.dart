import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Button & Dialog"),
      ),
      body: Container(
        margin: EdgeInsets.only(top:200.0, right: 50.0, left: 50.0),
        width: 300.0,
        height: 50.0,
        child: RaisedButton(
          color: Colors.red,
          child: Text(
              "Tap on Button to see Dialog",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),

          ),
            onPressed: () =>  displayDialog(context)
        ),
      ),
    );
  }

  // execute method on press of button and show dialog
  void displayDialog(BuildContext context) {

    var alertDialog = AlertDialog(
      title: Text("Hey, Button is pressed"),
      content: Text("Thanks for wathing my GIT"),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
    );
  }
  
}
