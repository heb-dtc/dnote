import 'package:dnote/home/home_screen_view_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenViewModel _viewModel;

  const HomeScreen(this._viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text("WELCOME",
                style:
                TextStyle(fontSize: 42, fontWeight: FontWeight.w500),)
            ],
          ),
        ),
      ),
    );
  }
}
