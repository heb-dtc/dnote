import 'package:dnote/login/login_screen_view_model.dart';
import 'package:dnote/models/server_configuration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  final LoginScreenViewModel _viewModel;

  LoginScreen(this._viewModel);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _viewModel,
      child: Consumer<LoginScreenViewModel>(builder: (context, viewModel, _) {
        viewModel.retrieveServerUrl();

        return Scaffold(
          appBar: AppBar(),
          body: Builder(
              builder: (BuildContext context) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 42, fontWeight: FontWeight.w300),
                              ),
                              Text(
                                "@",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 32),
                                child: _bla(viewModel),
                              ),
                              TextFormField(
                                key: Key("user"),
                                decoration: InputDecoration(labelText: "user"),
                                controller: _nameController,
                              ),
                              TextFormField(
                                key: Key("password"),
                                decoration:
                                    InputDecoration(labelText: "password"),
                                controller: _passwordController,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: RaisedButton(
                                    key: Key("login"),
                                    child: Text("LOGIN"),
                                    onPressed: () => _login(
                                        context,
                                        _nameController.text.trim(),
                                        _passwordController.text.trim(),
                                        viewModel),
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
  }

  _login(BuildContext context, String name, String password,
      LoginScreenViewModel viewModel) async {
    await viewModel.login(name, password).then((token) {
      final serverConfiguration = Provider.of<ServerConfiguration>(context, listen: false);
      serverConfiguration.token = token.key;
      Navigator.pushNamed(context, "/home");
    }).catchError(_onError(context));
  }

  _onError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('ERROR WHILE TRYING TO LOGIN'),
      backgroundColor: Colors.black,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _bla(LoginScreenViewModel viewModel) {
    final url = viewModel.getServerUrl();
    return url != null ? Text(url) : Text("loading");
  }
}
