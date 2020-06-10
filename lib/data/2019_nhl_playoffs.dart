import 'package:tournament_control/models/round.dart';
import 'package:tournament_control/models/series.dart';

final List<Round> stanleyCup2019 = [
  Round(
    roundNumber: 1,
    name: "Divisional Conference",
    serieses: [
      Series([6, 4], [5, 2]),
      Series([3, 2], [4, 4]),
      Series([1, 1], [2, 4]),
      Series([7, 4], [8, 3]),
      Series([9, 0], [16, 4]),
      Series([10, 4], [11, 3]),
      Series([13, 4], [12, 3]),
      Series([14, 4], [15, 0]),
    ],
  ),
  Round(
    roundNumber: 2,
    name: "Divisional Conference",
    serieses: [
      Series([6, 3], [4, 4]),
      Series([2, 3], [7, 4]),
      Series([16, 2], [10, 4]),
      Series([13, 4], [14, 0]),
    ],
  ),
  Round(
    roundNumber: 3,
    name: "Conference Finals",
    serieses: [
      Series([10, 4], [13, 0]),
      Series([4, 3], [7, 2]),
    ],
  ),
  Round(
    roundNumber: 4,
    name: "Stanley Cup Finals",
    serieses: [
      Series([17, 0], [17, 0])
    ],
  ),
];
