import 'dart:convert';

import 'package:dnote/models/home.dart';
import 'package:dnote/models/server_configuration.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class ServerApi {
  final ServerConfiguration _serverConfiguration;

  ServerApi(this._serverConfiguration);

  Future<Home> fetchNotes() async {
    Uri endPoint = Uri.parse(_serverConfiguration.baseUrl + '/api/notes');
    endPoint.replace(queryParameters: {'page': '1'});
    final cookie = "id=${_serverConfiguration.token}; __stripe_mid=3187a7b7-2616-45c0-afda-c3e2298a7be7";
    developer.log("fetch note -> $endPoint");

    final homeResponse = await http.get(endPoint,
        headers: {
          'Cookie': cookie,
        });


    if (homeResponse.statusCode == 200) {
      developer.log("note -> " + homeResponse.body);
      return Home.fromJson(json.decode(homeResponse.body));
    }

    developer.log("error -> ${homeResponse.statusCode}");
    developer.log("error -> ${homeResponse.body}");

    throw Future.error("");
  }
}