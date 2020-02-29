import 'package:dnote/models/account.dart';
import 'package:dnote/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LoginScreenViewModel extends ChangeNotifier {

  Future<User> login(account) async {
    final response = await signIn(account);

    if (response.statusCode == 200) {
      return User();
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<http.Response> signIn(Account account) {
    return http.post(account.getServerUrl() + '/api/v3/signin', body: {
      "email": account.getUserName(),
      "password": account.getPassword()
    });
  }
}
