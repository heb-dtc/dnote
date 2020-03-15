import 'package:dnote/models/home.dart';
import 'package:dnote/models/note.dart';
import 'package:dnote/services/server_api.dart';
import 'package:flutter/material.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final ServerApi _api;

  Home _home;

  HomeScreenViewModel(this._api);

  List<Note> get notes => _home != null ? _home.notes : [];

  Future<void> fetchNotes() async {
    _home = await _api.fetchNotes();
    notifyListeners();
  }
}
