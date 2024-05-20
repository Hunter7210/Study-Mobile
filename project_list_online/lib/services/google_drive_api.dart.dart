// google_drive_api.dart

import 'package:googleapis/admin/directory_v1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleDriveAPI {
  static Future<Map<String, dynamic>> uploadFileToDrive(
      String token, String fileId, String content) async {
    final token = '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';
    final url =
        "https://www.googleapis.com/upload/drive/v3/files/$fileId?uploadType=media";
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: content,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to upload file');
    }
  }

  static Future<Map<String, dynamic>> downloadFileFromDrive(
      String token, String fileId) async {
    final url = "https://www.googleapis.com/drive/v3/files/$fileId?alt=media";
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to download file');
    }
  }
}
