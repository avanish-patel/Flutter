import 'package:flutter/material.dart';
import 'package:notekepper/screens/notedetail.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NoteList();
  }
}

class _NoteList extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NoteKeeper"),
      ),

      body: getListView(),

      // floating action button
      floatingActionButton: FloatingActionButton(
      // on press of add button navigate to note detail page using Navigator
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NoteDetail("Add Note"))),
        tooltip: "Add Note",
        child: Icon(Icons.add),
      ),
    );
  }

  // function return ListView
  ListView getListView() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          // build card
          return Card(
            color: Colors.white,
            elevation: 2.0,
            // child of card is ListTile
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text("Some dummy text"),
              subtitle: Text("01/01/2019"),
              trailing: Icon(Icons.delete),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NoteDetail("Edit Note"))),
            )
          );
        });
  }
}
