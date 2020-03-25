import 'package:dnote/base_view.dart';
import 'package:dnote/note/note_screen_view_model.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  final NoteScreenViewModel _viewModel;

  static String routeName = '/note';

  NoteScreen(this._viewModel);

  @override
  Widget build(BuildContext context) => BaseView<NoteScreenViewModel>(
    model: _viewModel,
    onModelReady: (viewModel) => {},
    builder: (context, viewModel, child) => Scaffold(
      appBar: AppBar(title: Text(viewModel.note.book.label),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 22, 4, 22),
              child: Text(viewModel.note.content),
            ),
          ],
        ),
      ),
    ),
  );
}