import 'dart:convert';

import 'package:dnote/models/home.dart';
import 'package:dnote/models/note_list.dart';
import 'package:dnote/models/server_configuration.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class ServerApi {
  final ServerConfiguration _serverConfiguration;

  ServerApi(this._serverConfiguration);

  Future<NoteList> fetchNotes() async {
    Uri endPoint = Uri.parse(_serverConfiguration.baseUrl + '/api/notes');
    endPoint.replace(queryParameters: {'page': '1'});
    final cookie = "id=${_serverConfiguration.token}; __stripe_mid=3187a7b7-2616-45c0-afda-c3e2298a7be7";
    developer.log("fetch note -> $endPoint");

    final response = await http.get(endPoint,
        headers: {
          'Cookie': cookie,
        });

    if (response.statusCode == 200) {
      developer.log("note -> " + response.body);
      return NoteList.fromJson(json.decode(response.body));
    }

    developer.log("error -> ${response.statusCode}");
    developer.log("error -> ${response.body}");

    throw Future.error("");
  }
}