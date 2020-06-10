import 'package:flutter/material.dart';
import 'package:tournament_control/constants.dart';
import 'package:tournament_control/data/2019_nhl_playoff_teams.dart';
import 'package:tournament_control/models/round.dart';
import 'package:tournament_control/screens/tournament/widgets/header.dart';
import 'package:tournament_control/screens/tournament/widgets/team_matchup.dart';

/// This will take a Round; It loooks up the teams and their logos from a hashmap
class RoundsList extends StatelessWidget {
  const RoundsList({
    this.round,
    Key key,
  }) : super(key: key);
  final Round round;

  List<Widget> _teamMatchupGenerator() {
    List<Widget> out = [];

    round.serieses.forEach((series) {
      out.add(
        TeamMatchup(
          home: teams[series.firstTeamAndScore.first],
          homeScore: series.firstTeamAndScore.last,
          awayScore: series.secondTeamAndScore.last,
          away: teams[series.secondTeamAndScore.first],
          homeLogo: logos[series.firstTeamAndScore.first],
          awayLogo: logos[series.secondTeamAndScore.first],
        ),
      );
    });
    return out;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Header(title: round.name),
        Expanded(
          child: ListView(children: _teamMatchupGenerator()),
        ),
      ],
    );
  }
}
