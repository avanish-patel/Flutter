import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ListView & ListTile",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView & ListTile"),
        ),
        body:  getListView(),
      ),
  )
);

Widget getListView() {


  var listView = ListView(
    // array of widget with ListTile
    children: <Widget>[

      ListTile(
        leading: Icon(Icons.ac_unit),
        title: Text("Ac Unit"),
        subtitle: Text("Subtitle Ac Unit"),
        trailing: Icon(Icons.alarm),
        onTap: () =>  debugPrint("Tile is pressed"),
      ),
      ListTile(
        leading: Icon(Icons.account_balance),
        title: Text("Account Balance"),
        subtitle: Text("Account Balance Subtitile"),
        trailing: Icon(Icons.account_balance_wallet),
          onTap: () =>  debugPrint("Tile is pressed"),
      ),
      ListTile(
        leading: Icon(Icons.android),
        title: Text("Android"),
        subtitle: Text("Subtitle Andorid"),
          onTap: () =>  debugPrint("Tile is pressed"),
      ),

      Container(
        height: 40,
        color: Colors.red,
      ),

      Container(
        height: 40,
        color: Colors.green,
      )
    ],
  );


  return listView;
}
