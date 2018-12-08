import 'package:flutter/material.dart';

void main() => runApp(

  MaterialApp(
    title: "ListView Builder",
    home: Scaffold(
      appBar: AppBar(title: Text("Efficient ListView-Tile"),),
      body: showListView(),
    ),
  )
);


// generate 500 strings as data source
List<String> getDataAsStrings() {

  var strings = List<String>.generate(500, (index) => "Item ${index} !");

  return strings;
}

// method return ListView of ListTile
Widget showListView() {

  // get 500 strings
  var data = getDataAsStrings();

  // generate ListView using builder pattern
  var listView = ListView.builder(
      itemBuilder : (context, index){

        // return ListTile at every Index
        return ListTile(
          leading: Icon(Icons.android),
          title: Text(data[index]),
          onTap: () => debugPrint("${data[index]} Item Pressed."),
        );
      }
  );

  return listView;
}
