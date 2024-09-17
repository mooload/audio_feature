import 'dart:io';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';

class AudioFeatures {

  // final FFmpegKit _ffmpeg = FFmpegKit();

  Future<Map<String, dynamic>> getAudioFeatures(String filePath) async {
    final session = await FFprobeKit.getMediaInformation(filePath);
    final information = await session.getMediaInformation();

    if (information == null) {
      final state = FFmpegKitConfig.sessionStateToString(await session.getState());
      final returnCode = await session.getReturnCode();
      final failStackTrace = await session.getFailStackTrace();
      final duration = await session.getDuration();
      final output = await session.getOutput();

      print('State: $state');
      print('Return Code: $returnCode');
      print('Fail Stack Trace: $failStackTrace');
      print('Duration: $duration');
      print('Output: $output');

      return {};
    }

    final streams = information.getStreams();
    if (streams.isEmpty) {
      return {};
    }

    final audioStream = streams.firstWhere((stream) => stream.getType() == 'audio');
    final frequency = audioStream.getSampleRate();
    final amplitude = audioStream.getSampleRate();
    final decibel = audioStream.getSampleRate();

    return {
      'frequency': frequency,
      'amplitude': amplitude,
      'decibel': decibel,
    };
  }

}
