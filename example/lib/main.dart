import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

AudioPlayer player = AudioPlayer();

const testAudio = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';

void callbackHandler(state) {
  print('State change $state');
}

void main() {
  runApp(APNotificationsApp());
}

class APNotificationsApp extends StatefulWidget {
  @override
  _APNotificationsAppState createState() => _APNotificationsAppState();
}

class _APNotificationsAppState extends State<APNotificationsApp> {
  @override
  void initState() {
    super.initState();
    setupNotifications();
  }

  void setupNotifications() {
    player.startHeadlessService();
    player.monitorNotificationStateChanges(callbackHandler);
  }

  Widget buildMainPage(BuildContext context) {
    return Column(
      children: [
        Text('Click button to start'),
        RaisedButton(
          child: Text('Play + Notification'),
          onPressed: startPlaying,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  void startPlaying() async {
    await player.play(testAudio, isLocal: false, respectSilence: false, duckAudio: true);
    await player.setNotification(
      title: 'Song Title',
      albumTitle: 'Album Title',
      artist: 'Artist Name',
      imageUrl: 'https://luan.xyz/me/avatars/luan.nico.png',
      duration: Duration(seconds: 10),
      elapsedTime: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Audioplayers Notifications Example App'),
        ),
        body: Center(
          child: buildMainPage(context),
        ),
      ),
    );
  }
}
