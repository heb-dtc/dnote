import 'package:dnote/main.dart';
import 'package:dnote/models/server_configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreenViewModel extends ChangeNotifier {
  String _serverUrl;
  String _token;

  Future<void> loadConfiguration() async {
    await _loadToken();
    await _loadServerUrl();
    notifyListeners();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.get("token_key");
  }

  Future<void> _loadServerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    _serverUrl = prefs.get("server_url");
  }

  String get serverUrl => _serverUrl;
  String get token => _token;

  Future setDefaultServerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('server_url', "https://app.getdnote.com");
  }

  Future wipeConfiguration() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('server_url', null);
    prefs.setString('token_key', null);
    _serverUrl = null;
    _token = null;
    notifyListeners();
  }
}