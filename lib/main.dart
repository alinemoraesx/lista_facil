import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/colors.dart';
import 'screens/home.dart';
import 'screens/welcome.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista Fácil',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: ColorsConstants.primary100,
          onPrimary: Colors.white,
          secondary: ColorsConstants.bg300,
          onSecondary:
              Colors.white,
          surface: Colors.white,
          onSurface: ColorsConstants.primary100,
          background: Colors.white,
          onBackground: ColorsConstants.primary100,
          error: ColorsConstants.accent100,
          onError: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          color: ColorsConstants.primary100,
          titleTextStyle: TextStyle(
            color: ColorsConstants.primary100,
          ),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: ColorsConstants.bg200,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: FutureBuilder<bool>(
        future: _checkUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData && snapshot.data!) {
            return const Home();
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }

  Future<bool> _checkUserLoggedIn() async {
    // Simulate a check for user login status
    // For real applications, check a database, token, or other means of authentication
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return false; // Return true if logged in, false otherwise
  }
}
