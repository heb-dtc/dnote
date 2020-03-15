import 'package:dnote/models/note.dart';

class Home {
  final List<Note> notes;
  final int total;

  Home(this.notes, this.total);

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      jsonToNotes(json['notes']),
      json['total'],
    );
  }
}

List<Note> jsonToNotes(List<dynamic> json) =>
    json.map((noteJson) => Note.fromJson(Map.from(noteJson))).toList();
