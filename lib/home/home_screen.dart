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
              child: RefreshIndicator(
                onRefresh: () => viewModel.fetchNotes(),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children:
                      viewModel.notes.map((note) => _renderNote(note)).toList(),
                ),
              )),
        ),
      ),
    );
  }

  Widget _renderNote(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Card(
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    note.book.label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  note.content,
                  maxLines: 4,
                )
              ],
            ),
          ))),
        ],
      ),
    );
  }
}
