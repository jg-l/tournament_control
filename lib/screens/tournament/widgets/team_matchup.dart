import 'package:flutter/material.dart';
import 'package:tournament_control/constants.dart';
import 'package:tournament_control/models/team.dart';

/// This Widget displays two teams, their logo and the series score
class TeamMatchup extends StatelessWidget {
  TeamMatchup(
      {this.home,
      this.away,
      this.homeScore,
      this.awayScore,
      this.homeLogo,
      this.awayLogo});
  final Team home;
  final int homeScore;
  final Team away;
  final int awayScore;
  final String homeLogo;
  final String awayLogo;

  static const kIconSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          home != null
              ? Text("${home.name} vs ${away.name}".toUpperCase())
              : Text("TBD".toUpperCase()),
          Container(
            margin: EdgeInsets.only(top: 4.0),
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(60.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: Image.asset(home != null ? homeLogo : nhlLogo,
                        height: kIconSize)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    homeScore.toString(),
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: homeScore > awayScore
                            ? Colors.black
                            : Colors.black54),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    awayScore.toString(),
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: homeScore < awayScore
                            ? Colors.black
                            : Colors.black54),
                  ),
                ),
                Flexible(
                    child: Image.asset(away != null ? awayLogo : nhlLogo,
                        width: kIconSize)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
