import 'dart:io';

import 'package:nyxx/nyxx.dart';
import 'package:nyxx/Vm.dart';
//import 'package:nyxx/commands.dart';

import 'package:random_team/random_team.dart';

// Main funcuion
void main() {
  Nyxx bot = NyxxVm(Platform.environment['DISCORD_TOKEN']);

  bot.onMessageReceived.listen((MessageEvent e) {
    List<String> message = e.message.toString().split(' ');
    if (message[0] == '!rt') {
      var channel = (e.message.author as Member).voiceState.channel;
      List<String> users = channel.connectedUsers
          .map((voiceState) => voiceState.user.username)
          .toList();
      Players players = Players(users);
      Map<String, List<String>> randomTeam;
      try {
        randomTeam = players.getRondomTeam(int.parse(message[1]));
        e.message.channel.send(embed: makeEmbed(randomTeam));
      } catch (e) {
        e.message.channel.send(content: 'Error');
      }
    }
  });
}

EmbedBuilder makeEmbed(Map<String, List<String>> randomTeam) {
  EmbedBuilder embed = (EmbedBuilder()
    ..title = "random team"
    ..color = DiscordColor.fromInt(13369286));
  randomTeam.forEach((key, value) => embed.addField(
      name: key,
      content: value.isNotEmpty ? ' ' + value.join(', ') : '👻',
      inline: true));
  return embed;
}
