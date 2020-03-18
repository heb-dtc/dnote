import 'package:dnote/home/home_screen.dart';
import 'package:dnote/home/home_screen_view_model.dart';
import 'package:dnote/landing/landing_screen.dart';
import 'package:dnote/landing/landing_screen_view_model.dart';
import 'package:dnote/login/login_screen.dart';
import 'package:dnote/login/login_screen_view_model.dart';
import 'package:dnote/models/server_configuration.dart';
import 'package:dnote/server/server_screen_view_model.dart';
import 'package:dnote/server/server_url_screen.dart';
import 'package:dnote/services/server_api.dart';
import 'package:dnote/splash/splash_screen.dart';
import 'package:dnote/splash/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final ServerConfiguration _serverConfiguration = ServerConfiguration();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => _serverConfiguration,
        child: MaterialApp(
          title: 'DNote',
          theme: ThemeData(
            primaryColor: Colors.black,
            primaryColorDark: Colors.black,
            accentColor: Colors.black,
            backgroundColor: Colors.white,
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.black, textTheme: ButtonTextTheme.primary),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(SplashScreenViewModel()),
            '/landing': (context) => LandingScreen(LandingScreenViewModel()),
            '/server': (context) => ServerUrlScreen(ServerScreenViewModel()),
            '/login': (context) => LoginScreen(LoginScreenViewModel()),
            '/home': (context) => HomeScreen(HomeScreenViewModel(ServerApi(_serverConfiguration))),
          },
        ),
      );
}
