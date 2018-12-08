import 'package:flutter/material.dart';

void main() => runApp(

  MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "FAB & SnackBar",
    home: Scaffold(
      appBar: AppBar(title: Text("FAB & SnackBar"),),
      // calling showListView to show tiles
      body: showListView(),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        tooltip: "Add item!",
      ),
    ),
  )
);


// method generate SnackBar
void showSnackBar(BuildContext context, String item) {

  var snackBar = SnackBar(
    // content show on SnackBar
    content: Text(item),
    // Undo button on SnackBar
    action: SnackBarAction(
        label: "Undo",
        onPressed: () => debugPrint("Undo Pressed")
    ),
  );

  Scaffold.of(context).showSnackBar(snackBar);

}


// return ListView of ListTile
Widget showListView() {

  var people = ["Fritz Beil","Madeline Dorris","Jillian Cruzan","Mardell Shireman","Wilmer Heslin","Marisa Newburn","Sherise Kindig","Alexia Schoemaker","Dora Membreno","Guillermina Medlen","Lesa Rochon","Esperanza Lavallie","Oma Ingalls","Grazyna Morvant","Ella Feder","James Doyel","Jaymie Denise","Anh Feddersen","Ryan Wilmeth","Willow Evins"];

  // generate ListView using ListTile and return from function
  var listView = ListView.builder(
      itemBuilder:(context, index){

        return ListTile(
          leading: Icon(Icons.call),
          title: Text(people[index]),
          onTap: () => showSnackBar(context, people[index]),
        );
      });


  return listView;
}


