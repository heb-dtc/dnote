import 'package:dnote/base_view.dart';
import 'package:dnote/landing/landing_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  final LandingScreenViewModel _viewModel;

  const LandingScreen(this._viewModel);

  @override
  Widget build(BuildContext context) => BaseView<LandingScreenViewModel>(
      model: _viewModel,
      onModelReady: (viewModel) => viewModel.checkServerUrl(),
      builder: (context, viewModel, child) => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                  child: Text(
                    "DNOTE",
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 8, 32, 32),
                  child: _buildOptions(context, viewModel),
                ),
              ],
            ),
          ));

  Widget _buildOptions(BuildContext context, LandingScreenViewModel viewModel) {
    if (viewModel.serverUrl != null) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: Text("Server URL -> " + viewModel.serverUrl,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/login"),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "use current server URL",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      ">",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => viewModel.wipeServerUrl(),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "change server URL",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    ">",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]);
    } else {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: Text(
            "No server URL. What do you want to do?",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: GestureDetector(
            onTap: () => _useDefaultServer(context, viewModel),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "use https://dnote.com",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      ">",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/server"),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "use custom server URL",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    ">",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]);
    }
  }

  _useDefaultServer(BuildContext context, LandingScreenViewModel viewModel) {
    viewModel.setDefaultServerUrl().then((_) {
      Navigator.pushNamed(context, "/login");
    });
  }
}
