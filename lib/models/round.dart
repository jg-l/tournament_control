import 'package:tournament_control/models/series.dart';

class Round {
  Round({this.roundNumber, this.serieses, this.name});
  int roundNumber;
  String name;
  List<Series> serieses;
}
