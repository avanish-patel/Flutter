import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _NoteList();
  }

}


class _NoteList extends State<NoteList>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NoteKeeper"),
      ),

    );
  }

}
