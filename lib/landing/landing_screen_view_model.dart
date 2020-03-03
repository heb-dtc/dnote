import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreenViewModel extends ChangeNotifier {
  String _serverUrl;

  Future<void> checkServerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    _serverUrl = prefs.get("server_url");
    notifyListeners();
  }

  String get serverUrl => _serverUrl;

  Future setDefaultServerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('server_url', "https://app.getdnote.com");
  }

  wipeServerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('server_url', null);
    _serverUrl = null;
    notifyListeners();
  }
}