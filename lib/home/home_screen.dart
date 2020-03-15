import 'package:dnote/base_view.dart';
import 'package:dnote/home/home_screen_view_model.dart';
import 'package:dnote/models/note.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenViewModel _viewModel;

  const HomeScreen(this._viewModel);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScreenViewModel>(
      model: _viewModel,
      onModelReady: (viewModel) => viewModel.fetchNotes(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "WELCOME",
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.w500),
                ),
                ...viewModel.notes.map((note) => _renderNote(note))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderNote(Note note) {
    return Text(note.uuid.uuid);
  }
}
