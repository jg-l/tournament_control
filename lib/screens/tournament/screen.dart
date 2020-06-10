import 'package:flutter/material.dart';
import 'package:tournament_control/constants.dart';
import 'package:tournament_control/data/2019_nhl_playoff_teams.dart';
import 'package:tournament_control/data/2019_nhl_playoffs.dart';
import 'package:tournament_control/models/round.dart';
import 'package:tournament_control/models/team.dart';

class TournamentScreen extends StatefulWidget {
  @override
  _TournamentScreenState createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  final List<String> navigation = [
    "Round 1",
    "Round 2",
    "Round 3",
    "Finals",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFf5f5f5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Image.asset(nhlLogo, width: 36),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildNavigation(),
            ),
          ),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (page) {
            setState(() {
              _currentIndex = page;
            });
          },
          children: <Widget>[
            RoundsList(round: stanleyCup2019.first),
            RoundsList(round: stanleyCup2019[1]),
            RoundsList(round: stanleyCup2019[2]),
            RoundsList(round: stanleyCup2019[3]),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildNavigation() {
    return navigation
        .asMap()
        .map((i, value) => MapEntry(
            i,
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = i;
                  _pageController.animateToPage(i,
                      duration: Duration(milliseconds: 380),
                      curve: Curves.easeInOutQuart);
                });
              },
              child: NavTab(
                currentIndex: _currentIndex,
                label: value,
                id: i,
              ),
            )))
        .values
        .toList();
  }
}

class NavTab extends StatelessWidget {
  const NavTab({
    Key key,
    this.id,
    this.label,
    @required int currentIndex,
  })  : _currentIndex = currentIndex,
        super(key: key);

  final int id;
  final int _currentIndex;
  final String label;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: _currentIndex == id ? Colors.orange : Colors.black,
      ),
      duration: Duration(milliseconds: 380),
      curve: Curves.easeInOutQuart,
      child: Text(
        label,
        style: TextStyle(
          color: _currentIndex == id ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// This will take a Round
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
            child: round.serieses.length != 0
                ? ListView(children: _teamMatchupGenerator())
                : Text("Stanley Cup Finals")),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    this.title,
    Key key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.black),
          ),
          Text(
            "2019",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

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
          OneVOneWidget(
            homeIcon: home != null ? homeLogo : nhlLogo,
            awayIcon: away != null ? awayLogo : nhlLogo,
            homeScore: homeScore,
            awayScore: awayScore,
          ),
        ],
      ),
    );
  }
}

class OneVOneWidget extends StatelessWidget {
  const OneVOneWidget({
    this.homeIcon,
    this.awayIcon,
    this.awayScore,
    this.homeScore,
    Key key,
  }) : super(key: key);
  final String homeIcon;
  final String awayIcon;
  final int homeScore;
  final int awayScore;

  static const kIconSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Flexible(child: Image.asset(homeIcon, height: kIconSize)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              homeScore.toString(),
              style: Theme.of(context).textTheme.headline4.copyWith(
                  color: homeScore > awayScore ? Colors.black : Colors.black54),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              awayScore.toString(),
              style: Theme.of(context).textTheme.headline4.copyWith(
                  color: homeScore < awayScore ? Colors.black : Colors.black54),
            ),
          ),
          Flexible(child: Image.asset(awayIcon, width: kIconSize)),
        ],
      ),
    );
  }
}
