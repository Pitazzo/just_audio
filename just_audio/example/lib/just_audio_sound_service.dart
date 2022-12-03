import 'package:just_audio/just_audio.dart';

class JustAudioSoundService {
  final Map<String, AudioPlayer> _players = {};

  static Future<JustAudioSoundService> setup() async {
    final service = JustAudioSoundService();
    await service.loadFromAsset('tap', 'tap.mp3');
    await service.loadFromAsset('nature', 'nature.mp3');
    return service;
  }

  Future<void> play(String name, {bool loop = false, String? fallback}) async {
    await _players[name]!.seek(Duration.zero);
    await _players[name]!.play();
  }

  Future<void> loadFromAsset(String soundName, String assetPath) async {
    final player = AudioPlayer();
    await player.setAsset('audio/$assetPath');

    _players.putIfAbsent(soundName, () => player);
  }
}
