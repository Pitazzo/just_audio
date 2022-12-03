// This is a minimal example demonstrating a play/pause button and a seek bar.
// More advanced examples demonstrating other features can be found in the same
// directory as this example in the GitHub repository.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:just_audio_example/common.dart';
import 'package:just_audio_example/just_audio_sound_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder<JustAudioSoundService>(
            future: JustAudioSoundService.setup(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }

              return Column(
                children: [
                  Center(
                    child: TextButton(
                      onPressed: () async {
                        print('Before nature!');
                        await snapshot.data!.play('nature');
                        print('After nature!');
                      },
                      child: const Text('Nature!'),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () async {
                        print('Before tap!');
                        await snapshot.data!.play('tap');
                        print('After tap!');
                      },
                      child: const Text('Tap!'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
