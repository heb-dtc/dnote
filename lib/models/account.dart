import 'package:dnote/models/server.dart';
import 'package:flutter/foundation.dart';

class Account extends ChangeNotifier {
  Server _server;
  String _userName;
  String _password;

  getServerUrl() => _server.get();
  getUserName() => _userName;
  getPassword() => _password;

  addServer(String url) => _server = Server(url);

  addUser(String name, String password) {
    _userName = name;
    _password = password;
  }
}