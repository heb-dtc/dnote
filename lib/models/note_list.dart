import 'package:dnote/models/note.dart';

class NoteList {
  final List<Note> notes;
  final int total;

  NoteList(this.notes, this.total);

  factory NoteList.fromJson(Map<String, dynamic> json) {
    return NoteList(
      jsonToNotes(json['notes']),
      json['total'],
    );
  }
}

List<Note> jsonToNotes(List<dynamic> json) =>
    json.map((noteJson) => Note.fromJson(Map.from(noteJson))).toList();