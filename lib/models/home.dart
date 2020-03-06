import 'package:dnote/models/note.dart';

class Home {
  final List<Note> notes;
  final int total;

  Home(this.notes, this.total);

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      json['notes'].map((noteJson) => Note.fromJson(noteJson)),
      json['total'],
    );
  }
}
