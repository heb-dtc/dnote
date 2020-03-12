import 'package:flutter/foundation.dart';

class ServerConfiguration extends ChangeNotifier {

  String _baseUrl;
  String _token;

  set baseUrl(value) => _baseUrl = value;
  set token(value) => _token = value;

  String get baseUrl => _baseUrl;
  String get token => _token;
}