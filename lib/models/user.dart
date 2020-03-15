import 'note.dart';

class User {
  final Id uuid;
  final String name;

  User(this.uuid, this.name);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      Id(json['uuid']),
      json['name'],
    );
  }
}