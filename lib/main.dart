import 'package:dnote/home/home_screen_view_model.dart';
import 'package:dnote/landing/landing_screen.dart';
import 'package:dnote/landing/landing_screen_view_model.dart';
import 'package:dnote/login/login_screen.dart';
import 'package:dnote/login/login_screen_view_model.dart';
import 'package:dnote/models/server_configuration.dart';
import 'package:dnote/server/server_screen_view_model.dart';
import 'package:dnote/services/server_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home_screen.dart';
import 'server/server_url_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Provider(
        create: (context) => ServerConfiguration(),
        child: MaterialApp(
          title: 'DNote',
          theme: ThemeData(
            primaryColor: Colors.black,
            primaryColorDark: Colors.black,
            accentColor: Colors.black,
            backgroundColor: Colors.white,
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.black,
              textTheme: ButtonTextTheme.primary
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LandingScreen(LandingScreenViewModel()),
            '/server': (context) => ServerUrlScreen(ServerScreenViewModel()),
            '/login': (context) => LoginScreen(LoginScreenViewModel()),
            '/home': (context) => HomeScreen(HomeScreenViewModel(ServerApi(Provider.of<ServerConfiguration>(context, listen: false)))),
          },
        ),
      );
}
