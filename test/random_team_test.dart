import 'package:random_team/random_team.dart';
import 'package:test/test.dart';

void main() {
  Players players = Players(['dennougorilla', 'poccariswet', 'juvikun']);
  test('getRandomTeam', () {
    expect(players.getRondomTeam(2)['A'].length, 1);
    expect(players.getRondomTeam(2)['B'].length, 1);
    expect(players.getRondomTeam(2)['sub'].length, 1);
  });
}
