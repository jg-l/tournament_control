// A Series has two teams and their scores in that series
class Series {
  Series(this.firstTeamAndScore, this.secondTeamAndScore);
  // The first team's ID (based on hashmap), and their score
  List<int> firstTeamAndScore;
  // The second team's ID (based on hashmap), and their score
  List<int> secondTeamAndScore;
}
