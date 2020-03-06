import 'dart:convert';

import 'package:dnote/models/home.dart';
import 'package:dnote/models/server_configuration.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class ServerApi {
  final ServerConfiguration _serverConfiguration;

  ServerApi(this._serverConfiguration);


  Future<Home> fetchNotes() async {
    developer.log("fetch note -> " + _serverConfiguration.baseUrl);
    final endPoint = _serverConfiguration.baseUrl + '/api/v3/notes?page=1';
    developer.log("fetch note -> " + endPoint);

    final homeJson = await http.get(endPoint,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });

    return Home.fromJson(json.decode(homeJson.body));
  }
}