import 'package:flutter/material.dart';
import 'package:notekepper/screens/notedetail.dart';
import 'package:notekepper/screens/notelist.dart';


void main() => runApp(NoteKeeper());


class NoteKeeper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NoteKeeper",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }

}