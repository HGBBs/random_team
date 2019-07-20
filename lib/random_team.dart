class Players {
  List<String> teamNameList = [
    '🐯 team',
    '🦍 team',
    '🦅 team',
    '🐍 team',
    '🦈 team',
    '🦂 team',
    '🐊 team',
    '🐺 team',
    '🦇 team',
    '🐙 team',
    '🐃 team',
    '🐻 team',
    '🐫 team',
    '🦄 team',
    '🐉 team',
    '🐏 team',
    '🐰 team',
    '🦉 team',
    '🕷 team',
    '🐝 team',
    '🐡 team',
    '🐬 team',
    '🐳 team',
    '🐌 team',
    '🦑 team',
    '🐒 team',
    '🦊 team',
  ];
  List<String> players;
  Players(this.players);

  Map<String, List<String>> getRondomTeam(int teamNum) {
    int fill = players.length % teamNum;
    Map<String, List<String>> teams = {};
    teamNameList.shuffle();
    teamNameList.add('😇 sub');
    players.shuffle();
    int m = players.length ~/ teamNum;
    teamNameList.take(teamNum).toList().asMap().forEach(
        (i, teamName) => teams[teamName] = players.sublist(i * m, i * m + m));
    teams['😇 sub'] = players.sublist(players.length - fill, players.length);
    return teams;
  }
}
