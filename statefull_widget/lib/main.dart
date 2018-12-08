import 'package:flutter/material.dart';

// main method
void main() => runApp(
  MaterialApp(
    title: "Stateless Widget",
    home: Home(),
  )
);

// Home class extends StatefulWidget
class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }

}
// state of Home class
class _Home extends State<Home> {

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull Widget"),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            // first widget in column
            Container(
              child: Text("Enter your name :",
                style: TextStyle(fontSize: 30.0),
                textAlign: TextAlign.left,
              ),

            ),

            // second widget in column
            TextField(
              style: TextStyle(fontSize: 30.0, color: Colors.red),
              onSubmitted: (String input){
                // set state on submit
                setState(() {
                  name = "Hey, ${input}";
                });
             }),

            // third widget in column
            Container(
              margin: EdgeInsets.all(30.0),
              child: Text("${name}", style: TextStyle(fontSize: 30.0),),
            )
          ],
        ),
      ),
    );
  }

}
