import 'package:flutter/material.dart';
import 'package:notekepper/model/note.dart';
import 'package:notekepper/utils/database_helper.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(note,appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  String appBarTitle;
  Note note;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  DatabaseHelper _databaseHelper = DatabaseHelper();

  NoteDetailState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    titleController.text = note.title;
    descController.text = note.description;

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            // title text field
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value) => updateTitle(),
                decoration: InputDecoration(
                  labelText: "Title",
                  labelStyle: textStyle,
                ),
              ),
            ),

            // description text field
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: descController,
                style: textStyle,
                onChanged: (value) => updateDescription(),
                decoration: InputDecoration(
                    labelText: "Description", labelStyle: textStyle),
              ),
            ),

            // row for two buttons
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  // save button
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.green,
                      onPressed: () => _save(),
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),

                  Container(
                    width: 10.0,
                  ),
                  // delete button
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.red,
                      onPressed: () => debugPrint("delete pressed"),
                      child: Text(
                        "Delete",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateTitle() {
    note.title = titleController.text;

  }

  void updateDescription(){
    note.description = descController.text;
  }

  void _save() async {

    note.date = DateTime.now() as String;
    if(note.id != null) {
      await _databaseHelper.updateNote(note);
    }else {
      await _databaseHelper.insertNote(note);
    }
    // can show dialog
  }

  void _delete() async {
    if(note.id == null) {
      return;
    }
    await _databaseHelper.deleteNote(note.id);

  }

//
//  void _showAlertDialog(String title, String message){
//
//    AlertDialog alertDialog = AlertDialog(
//      title: Text(title),
//      content: Text(message),
//
//    );
//
//    showDialog(context: context, builder: (_) => alertDialog);
//
//  }

}
