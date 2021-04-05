import 'package:fremo_app/utils/secureStorage.dart';
import 'package:http/http.dart' as http;

String baseUrl = "localhost:4000";

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
    final url = Uri.http(baseUrl, path, parameters);
    final headers = await getHeader();

    final http.Response response = await http.get(url, headers: headers);

    return response;
  }

  static Future<http.Response> requestPost({
    String path,
    Map<String, dynamic> parameters,
    Map<String, dynamic> body,
  }) async {
    final url = Uri.http(baseUrl, path, parameters);
    final headers = await getHeader();

    final http.Response response =
        await http.post(url, headers: headers, body: body);

    return response;
  }

  static Future<Map<String, String>> getHeader() async {
    final String token = await SecureStorageUtil.getData("token");

    Map<String, String> headers = {"token": token};
    return headers;
  }
}
