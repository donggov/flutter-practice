import 'package:flutter/material.dart';
import 'package:sqlite/note_list.dart';

import 'inherited_widget/note_inherited_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget(
        MaterialApp(
          title: 'Note',
          home: NoteList(),
        ),
    );
  }
}