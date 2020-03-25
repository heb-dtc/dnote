import 'package:dnote/models/home.dart';
import 'package:dnote/models/note.dart';
import 'package:dnote/services/server_api.dart';
import 'package:flutter/material.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final ServerApi _api;

  Home _home;

  HomeScreenViewModel(this._api);

  Future<void> fetchHome() async {

  }
}
