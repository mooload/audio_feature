import 'package:flutter_sound/flutter_sound.dart';

class Recorder {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();

  Future<void> startRecording() async {
    await _recorder.startRecorder(toFile: 'audio_sample.wav');
  }

  Future<void> stopRecording() async {
    await _recorder.stopRecorder();
  }
}
