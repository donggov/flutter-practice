import 'package:flutter/material.dart';
import 'package:sqlite/note_provider.dart';

import 'note.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes"),),
      body: FutureBuilder(
        future: NoteProvider.getNoteList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final notes = snapshot.data;
            return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Note(NoteMode.Edit, notes[index])));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            NoteTitle(notes[index]['title']),
                            NoteContent(notes[index]['content']),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              itemCount: notes.length,
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Note(NoteMode.Add, null)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NoteTitle extends StatelessWidget {
  final String title;

  NoteTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text('$title', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),);
  }
}

class NoteContent extends StatelessWidget {
  final String content;

  NoteContent(this.content);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$content',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

