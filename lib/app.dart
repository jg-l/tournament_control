import 'package:flutter/material.dart';
import 'package:tournament_control/screens/tournament/screen.dart';
import 'package:tournament_control/utils.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stanley Cup 2019",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      // ignore: missing_return
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return PageRoutes.fade(() => TournamentScreen());
        }
      },
    );
  }
}
