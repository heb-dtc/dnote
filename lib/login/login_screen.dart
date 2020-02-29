import 'package:dnote/login/login_screen_view_model.dart';
import 'package:dnote/models/account.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  final LoginScreenViewModel _viewModel;

  LoginScreen(this._viewModel);

  @override
  Widget build(BuildContext context) {
    var account = Provider.of<Account>(context);

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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 42, fontWeight: FontWeight.w300),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 32),
                            child: Text(account.getServerUrl()),
                          ),
                          TextFormField(
                            key: Key("user"),
                            decoration: InputDecoration(labelText: "user"),
                            controller: _nameController,
                          ),
                          TextFormField(
                            key: Key("password"),
                            decoration: InputDecoration(labelText: "password"),
                            controller: _passwordController,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: RaisedButton(
                                color: Color(0xFF6699cc),
                                key: Key("login"),
                                child: Text("login"),
                                onPressed: () => _login(
                                    context,
                                    account,
                                    _nameController.text,
                                    _passwordController.text),
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

  _login(BuildContext context, Account account, String name, String password) {
    account.addUser(name, password);
    try {
      final user = _viewModel.login(account);
      Navigator.pushNamed(context, "/home");
    } catch (exception) {}
  }
}
