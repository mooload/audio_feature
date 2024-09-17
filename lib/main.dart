import 'package:flutter/material.dart';
import 'recorder.dart';
import 'audio_features.dart';
import 'save_features.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Recorder _recorder = Recorder();
  final AudioFeatures _audioFeatures = AudioFeatures();
  final SaveFeatures _saveFeatures = SaveFeatures();

  void _startRecording() async {
    await _recorder.startRecording();
  }

  void _stopRecording() async {
    await _recorder.stopRecording();
    final features = await _audioFeatures.getAudioFeatures('audio_sample.wav');
    print('Frequency: ${features['frequency']} Hz');
    print('Amplitude: ${features['amplitude']}');
    print('Decibel: ${features['decibel']} dB');
    await _saveFeatures.saveFeatures(features);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sound Recognition App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _startRecording,
              child: Text('Start Recording'),
            ),
            ElevatedButton(
              onPressed: _stopRecording,
              child: Text('Stop Recording'),
            ),
          ],
        ),
      ),
    );
  }
}
