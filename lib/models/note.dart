import 'package:dnote/models/user.dart';

class Note {
  final Id uuid;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String content;
  final int addedOn;
  final bool public;
  final String usn;
  final Book book;
  final User user;

  Note(this.uuid, this.createdDate, this.modifiedDate, this.content,
      this.addedOn, this.public, this.usn, this.book, this.user);

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      Id.fromJson(json['uuid']),
      json['created_at'],
      json['updated_at'],
      json['content'],
      json['added_on'],
      json['public'],
      json['usn'],
      Book.fromJson(json['book']),
      User.fromJson(json['user']),
    );
  }
}

class Book {
  final Id uuid;
  final String label;

  Book(this.uuid, this.label);

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      Id.fromJson(json['uuid']),
      json['label'],
    );
  }
}

class Id {
  final String uuid;

  Id(this.uuid);

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(json['uuid']);
  }
}
