import 'package:flutter/material.dart';
import 'package:sqlite/note_provider.dart';

import 'inherited_widget/note_inherited_widget.dart';

enum NoteMode {
  Add,
  Edit,
}

class Note extends StatefulWidget {
  final NoteMode _noteMode;
  final Map<String, dynamic> note;

  Note(this._noteMode, this.note);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {

//  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (widget.note != null) {
      _titleController.text = widget.note['title'];
      _contentController.text = widget.note['content'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._noteMode == NoteMode.Add ? 'Add' : 'Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                hintText: 'Content',
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                widget._noteMode == NoteMode.Add ? NoteButton('Discard', Colors.grey, () { Navigator.pop(context); }) : Container(),

                widget._noteMode == NoteMode.Edit ? NoteButton('Delete', Colors.red, () async {
                  await NoteProvider.deleteNote(widget.note['id']);
                  Navigator.pop(context);
                }) : Container(),

                NoteButton('Save', Colors.blue,() async {
                  final title = _titleController.text;
                  final content = _contentController.text;

                  if (widget._noteMode == NoteMode.Add) {
                    await NoteProvider.insertNote({
                      'title': title,
                      'content': content,
                    });

                  } else if (widget._noteMode == NoteMode.Edit) {
                    await NoteProvider.updateNote({
                      'id': widget.note['id'],
                      'title': _titleController.text,
                      'content': _contentController.text,
                    });
                  }

                  Navigator.pop(context);
                }),
              ],
            ),
          ],
        ),
      )
    );
  }
}

class NoteButton extends StatelessWidget {

  final String _title;
  final Color _color;
  final Function _onPressed;

  NoteButton(this._title, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(_title, style: TextStyle(color: Colors.white),),
      color: _color,
      minWidth: 80,
      height: 40,
    );
  }
}

