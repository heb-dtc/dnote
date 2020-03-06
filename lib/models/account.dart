import 'package:dnote/models/server.dart';
import 'package:flutter/foundation.dart';

class ServerConfiguration extends ChangeNotifier {
  String _baseUrl;
  String _token;

  set baseUrl(value) => _baseUrl;
  set token(value) => _token;

  String get baseUrl => _baseUrl;
  String get token => _token;
}