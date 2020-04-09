import 'package:dnote/base_view.dart';
import 'package:dnote/home/home_screen_view_model.dart';
import 'package:dnote/models/note.dart';
import 'package:dnote/note/note_screen.dart';
import 'package:dnote/notes/notes_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenViewModel _viewModel;

  const HomeScreen(this._viewModel);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScreenViewModel>(
        model: _viewModel,
        onModelReady: (viewModel) => {},
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: Text("WELCOME"),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton.extended(
                elevation: 2.0,
                icon: Icon(Icons.add),
                label: const Text('Add note'),
                onPressed: () {}
              ),
              bottomNavigationBar: BottomAppBar(
                elevation: 2.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.menu), onPressed: () {},),
                    IconButton(icon: Icon(Icons.search), onPressed: () {},),
                  ],
                ),
              ),
              body: SafeArea(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        child: Text("BOOKS"),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(NotesScreen.routeName),
                      ),
                      RaisedButton(
                        child: Text("NOTES"),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(NotesScreen.routeName),
                      ),
                      RaisedButton(
                        child: Text("NOTES"),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(NotesScreen.routeName),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
