import 'package:flutter/material.dart';
import 'package:tournament_control/constants.dart';
import 'package:tournament_control/data/2019_nhl_playoffs.dart';
import 'package:tournament_control/screens/tournament/widgets/nav_tab.dart';
import 'package:tournament_control/screens/tournament/widgets/rounds_list.dart';

class TournamentScreen extends StatefulWidget {
  static const routeName = "/";
  @override
  _TournamentScreenState createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  int _currentIndex = 2;
  PageController _pageController = PageController(initialPage: 2);

  final List<String> _navigation = [
    "Round 1",
    "Round 2",
    "Round 3",
    "Finals",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFf5f5f5),
      child: SafeArea(
        bottom: false,
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
      ),
    );
  }

  List<Widget> _buildNavigation() {
    return _navigation
        .asMap()
        .map((i, value) => MapEntry(
            i,
            Flexible(
              child: GestureDetector(
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
              ),
            )))
        .values
        .toList();
  }
}
