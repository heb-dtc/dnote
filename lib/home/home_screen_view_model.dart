import 'package:dnote/models/note.dart';
import 'package:dnote/services/server_api.dart';
import 'package:flutter/material.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final ServerApi _api;

  List<Note> _notes;

  HomeScreenViewModel(this._api);

  Future<void> fetchNotes() async {
    await _api.fetchNotes();
  }
}