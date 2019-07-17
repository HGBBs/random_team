import 'package:random_team/random_team.dart';
import 'package:test/test.dart';

void main() {
  Player player = Player(['dennougorilla', 'poccariswet', 'juvikun']);
  test('getRandomTeam', () {
    expect(player.getRondomTeam(2)['A'].length, 1);
    expect(player.getRondomTeam(2)['B'].length, 1);
    expect(player.getRondomTeam(2)['sub'].length, 1);
  });
}
