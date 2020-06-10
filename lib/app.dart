import 'package:flutter/material.dart';
import 'package:tournament_control/screens/tournament/screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TournamentScreen(),
    );
  }
}
