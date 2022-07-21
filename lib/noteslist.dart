// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  String? noteValue;

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes List Screen'),
      ),
      body: Center(
        //we are adding null safety in this noteValue by adding !
        //if note is null show No notes available else show the noteValue
        child:
            noteValue == null ? Text('No notes available') : Text(noteValue!),
      ),
    );
  }

  void getNotes() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    noteValue = pref.getString('noteData');
    setState(() {});
  }
}
