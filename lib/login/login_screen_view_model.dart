import 'dart:convert';

import 'package:dnote/models/token.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenViewModel extends ChangeNotifier {
  bool _userIslogged = false;
  String _serverUrl;

  bool isUserLogged() => _userIslogged;

  String getServerUrl() => _serverUrl;

  Future<void> retrieveServerUrl() async {
    final prefs = await SharedPreferences.getInstance();

    _serverUrl = prefs.get("server_url");
    notifyListeners();
  }

  Future<Token> login(String userName, String password) async {
    final response = await _signIn(userName, password);

    if (response.statusCode == 200) {
      final token = Token.fromJson(json.decode(response.body));

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token_key', token.key);
      prefs.setInt('token_timestamp', token.timestamp);

      return token;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<http.Response> _signIn(String userName, String password) {
    final endPoint = _serverUrl + '/api/v3/signin';
    developer.log("login @ " + endPoint);

    return http.post(endPoint,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": userName,
          "password": password,
        }));
  }
}
