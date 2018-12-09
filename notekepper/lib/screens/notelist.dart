import 'package:flutter/material.dart';
import 'package:notekepper/screens/notedetail.dart';
import 'dart:async';
import 'package:notekepper/model/note.dart';
import 'package:notekepper/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NoteList();
  }
}

class _NoteList extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("NoteKeeper"),
      ),

      body: getListView(),

      // floating action button
      floatingActionButton: FloatingActionButton(
        // on press of add button navigate to note detail page using Navigator
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => NoteDetail(Note('','',''),"Add Note"))),
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
                title: Text(this.noteList[position].title),
                subtitle: Text(this.noteList[position].date),
                trailing: GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: () => _delete(context, noteList[position]),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NoteDetail(this.noteList[position],"Edit Note"))),
              ));
        });
  }

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);

    // showSnackbar on delete
    _showSnackBar(context, "Note Deleted Successfully");
    updateListView();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: Text(message),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  // set state of notelist and count and update the values according to value get from DB
  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
