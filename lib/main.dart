import 'package:audio_mixer/audio_mixer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(_MyHomePageState());

class _MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeLeft,
    ]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.black),
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "Volume Mixer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              automaticallyImplyLeading: false,
              centerTitle: true,
            ),
            body: AudioMixer()));
  }
}
