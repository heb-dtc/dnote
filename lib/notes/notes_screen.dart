import 'package:dnote/base_view.dart';
import 'package:dnote/models/note.dart';
import 'package:dnote/note/note_screen.dart';
import 'package:dnote/notes/notes_screen_view_model.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  static String routeName = '/notes';

  final NotesScreenViewModel _viewModel;

  NotesScreen(this._viewModel);

  @override
  Widget build(BuildContext context) {
    return BaseView<NotesScreenViewModel>(
      model: _viewModel,
      onModelReady: (viewModel) => viewModel.fetchNotes(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text("NOTES"),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: RefreshIndicator(
              onRefresh: () => viewModel.fetchNotes(),
              child: _renderNotes(viewModel.notes)),
        )),
      ),
    );
  }

  Widget _renderNotes(List<Note> notes) => ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) => _renderNote(context, notes[index]));

  Widget _renderNote(BuildContext context, Note note) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Expanded(
              child: Card(
                  child: InkWell(
            onTap: () => Navigator.of(context)
                .pushNamed(NoteScreen.routeName, arguments: note),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      note.book.label,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Text(
                    note.content,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          ))),
        ],
      ),
    );
  }
}
