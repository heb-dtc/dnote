import 'package:dnote/login/login_screen_view_model.dart';
import 'package:dnote/models/account.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServerUrlScreen extends StatelessWidget {
  final _serverUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var account = Provider.of<Account>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Server URL"),
        ),
        body: Builder(
            builder: (BuildContext context) =>
                Padding(
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
                                  color: Color(0xFF6699cc),
                                  key: Key("go"),
                                  child: Text("Go"),
                                  onPressed: () =>
                                      _setServerUrl(
                                          context, _serverUrlController.text, account),
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
  }

  bool _validateServerUrl(String url) => url.startsWith('http');

  void _setServerUrl(BuildContext context, String url, Account account) {
    if (_validateServerUrl(url)) {
      account.addServer(url);
      Navigator.pushNamed(context, '/login');
    }
  }
}
