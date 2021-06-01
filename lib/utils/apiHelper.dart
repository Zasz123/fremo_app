import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:fremo_app/utils/secureStorage.dart';
import 'package:http/http.dart' as http;

String baseUrl = "10.0.2.2:4000";

class APIHelper {
  static final APIHelper _instance = APIHelper._();

  APIHelper._();

  factory APIHelper() {
    return _instance;
  }

  static Future<http.Response> requestGet({
    String path,
    Map<String, dynamic> parameters,
  }) async {
    try {
      final url = Uri.http(baseUrl, path, parameters);
      final headers = await getHeader();

      final http.Response response = await http.get(url, headers: headers);

      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<http.Response> requestPost({
    String path,
    Map<String, dynamic> parameters,
    Map<String, dynamic> body,
  }) async {
    try {
      final url = Uri.http(baseUrl, path, parameters);
      final headers = await getHeader();

      final http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));

      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<http.Response> requestPatch({
    String path,
    Map<String, dynamic> parameters,
    Map<String, dynamic> body,
  }) async {
    try {
      final url = Uri.http(baseUrl, path, parameters);
      final headers = await getHeader();

      final http.Response response =
          await http.patch(url, headers: headers, body: jsonEncode(body));

      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<http.Response> requestDelete({
    String path,
    Map<String, dynamic> parameters,
  }) async {
    try {
      final url = Uri.http(baseUrl, path, parameters);
      final headers = await getHeader();

      final http.Response response = await http.delete(url, headers: headers);

      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<Map<String, String>> getHeader() async {
    final String token = await SecureStorageUtil.getData("token");

    Map<String, String> headers = {
      "token": token,
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    return headers;
  }
}
