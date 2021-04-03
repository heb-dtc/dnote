import 'package:dnote/models/note.dart';
import 'package:dnote/services/server_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNoteScreenViewModel extends ChangeNotifier {

  final ServerApi _serverApi;
  final Note _note;

  AddNoteScreenViewModel(this._serverApi, this._note);

  Note get note => _note;
}