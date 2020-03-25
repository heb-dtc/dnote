import 'package:dnote/models/note.dart';
import 'package:dnote/models/note_list.dart';
import 'package:dnote/services/server_api.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class NotesScreenViewModel extends ChangeNotifier {
  final ServerApi _api;
  NoteList _notes;

  NotesScreenViewModel(this._api);

  List<Note> get notes => _notes != null ? _notes.notes : [];

  Future<void> fetchNotes() async {
    _notes = await _api.fetchNotes();
    notifyListeners();
  }
}