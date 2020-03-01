import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreenViewModel extends ChangeNotifier {
  bool _hasServerUrl = false;

  Future checkServerUrl() async {
    final prefs = await SharedPreferences.getInstance();

    _hasServerUrl = prefs.get("server_url") ? true : false;
    notifyListeners();
  }

  bool isServerUrlSet() => _hasServerUrl;

  Future setDefaultServerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('server_url', "https://app.getdnote.com");
  }
}