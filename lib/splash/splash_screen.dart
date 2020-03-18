import 'package:dnote/base_view.dart';
import 'package:dnote/splash/splash_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash_screen";

  final SplashScreenViewModel _viewModel;

  const SplashScreen(this._viewModel);

  @override
  Widget build(BuildContext context) => BaseView<SplashScreenViewModel>(
      model: _viewModel,
      onModelReady: (viewModel) => viewModel.loadData(context),
      builder: (context, viewModel, child) => Scaffold(
              body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "DNOTE",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
                ),
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              )
            ],
          )));
}
