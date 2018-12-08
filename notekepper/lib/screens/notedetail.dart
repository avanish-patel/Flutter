import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  
  String appBarTitle;
  
  NoteDetail(this.appBarTitle);
  
  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(appBarTitle);
  }

}

class NoteDetailState extends State<NoteDetail> {

  String appBarTitle;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  NoteDetailState(this.appBarTitle);


  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

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
                  onChanged: (value) => debugPrint("changed title"),
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
                  onChanged: (value)=> debugPrint("changed desc"),
                  decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: textStyle
                  ),
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
                        onPressed: () => debugPrint("save pressed"),
                        child: Text("Save", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                      ),
                    ),

                    Container(width: 10.0,),
                    // delete button
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.red,
                        onPressed: () => debugPrint("delete pressed"),
                        child: Text("Delete", style: TextStyle(fontSize: 20.0, color: Colors.white),),
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

}