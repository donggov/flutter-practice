import 'package:flutter/cupertino.dart';

class NoteInheritedWidget extends InheritedWidget {

  final notes = [
    {
      'title': 'asdfadsfsafasdfdasfasf',
      'content': 'asdfdsafdsafasdfasdfasfdsafasdfasdffs',
    },
    {
      'title': 'asdfadsfsafasdfdasfasf',
      'content': 'asdfdsafdsafasdfasdfasfdsafasdfasdffs',
    },
    {
      'title': 'asdfadsfsafasdfdasfasf',
      'content': 'asdfdsafdsafasdfasdfasfdsafasdfasdffs',
    },
  ];

  NoteInheritedWidget(Widget child) : super(child: child);

  static NoteInheritedWidget of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(NoteInheritedWidget) as NoteInheritedWidget);
//    return (context.dependOnInheritedWidgetOfExactType() as NoteInheritedWidget);
  }

  @override
  bool updateShouldNotify(NoteInheritedWidget oldWidget) {
    return oldWidget.notes != notes;
  }

}