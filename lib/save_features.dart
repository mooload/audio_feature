import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SaveFeatures {
  Future<void> saveFeatures(Map<String, dynamic> features) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/features.json');
    await file.writeAsString(jsonEncode(features));
  }
}
