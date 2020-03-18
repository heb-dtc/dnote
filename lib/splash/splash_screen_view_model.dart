import 'dart:async';

import 'package:dnote/models/server_configuration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenViewModel extends ChangeNotifier {
  Future<Timer> loadData(BuildContext context) async {
    return Timer(Duration(seconds: 2), () => _loadConfiguration(context));
  }

  Future<void> _loadConfiguration(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.get("token_key");
    final serverUrl = prefs.get("server_url");

    if (token != null && serverUrl != null) {
      Provider.of<ServerConfiguration>(context, listen: false).baseUrl =
          serverUrl;
      Provider.of<ServerConfiguration>(context, listen: false).token = token;
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacementNamed(context, "/landing");
    }
  }
}
