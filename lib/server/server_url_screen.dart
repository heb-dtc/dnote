import 'package:dnote/login/login_screen_view_model.dart';
import 'package:dnote/models/account.dart';
import 'package:dnote/server/server_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServerUrlScreen extends StatelessWidget {
  final _serverUrlController = TextEditingController();
  final ServerScreenViewModel _viewModel;

  ServerUrlScreen(this._viewModel);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => _viewModel,
        child:
            Consumer<ServerScreenViewModel>(builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Server"),
            ),
            body: Builder(
                builder: (BuildContext context) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  key: Key("server_url"),
                                  decoration:
                                      InputDecoration(labelText: "server url "),
                                  controller: _serverUrlController,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 48),
                                    child: RaisedButton(
                                      key: Key("go"),
                                      child: Text("GO"),
                                      onPressed: () => _setServerUrl(context,
                                          _serverUrlController.text, viewModel),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
          );
        }),
      );

  void _setServerUrl(
      BuildContext context, String url, ServerScreenViewModel viewModel) {
    viewModel.writeServerUrl(url).then((value) {
      final serverConfiguration = Provider.of<ServerConfiguration>(context);
      serverConfiguration.baseUrl = url;
      Navigator.pushNamed(context, '/login');
    }, onError: (error) {
      final snackBar = SnackBar(content: Text('SERVER URL NOT VALID'));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }
}
