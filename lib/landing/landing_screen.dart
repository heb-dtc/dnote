import 'package:dnote/landing/landing_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  final LandingScreenViewModel _viewModel;

  const LandingScreen(this._viewModel);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => _viewModel..checkServerUrl(),
        child: Consumer<LandingScreenViewModel>(
          builder: (context, viewModel, _) {
            return Scaffold(
              body: Builder(
                builder: (BuildContext context) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "DNOTE",
                            style: TextStyle(
                                fontSize: 42, fontWeight: FontWeight.w500),
                          ),
                        ),
                        _buildOptions(context, viewModel)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );

  Widget _buildOptions(BuildContext context, LandingScreenViewModel viewModel) {
    if (viewModel.isServerUrlSet()) {
      return Text("Server url is set moving to login screen");
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
