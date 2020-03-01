import 'dart:convert';

import 'package:dnote/models/account.dart';
import 'package:dnote/models/token.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';

class ServerScreenViewModel extends ChangeNotifier {
  String _serverUrl;

  String getServerUrl() => _serverUrl;

  bool _validateServerUrl(String url) => url.startsWith('http');

  Future<bool> writeServerUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();

    if (_validateServerUrl(url)) {
      prefs.setString('server_url', url);
      return true;
    }

    return Future.error(false);
  }
}
