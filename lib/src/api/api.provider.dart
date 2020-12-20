import 'dart:convert';
import 'dart:io';
import '../utils/api.const.dart';

class ApiProvider {
  const ApiProvider();

  Future<String?> makeGetRequest(
    String endpoint, {
    Map<String, String>? queryParams,
  }) async {
    final client = await HttpClient().getUrl(
      Uri.https(
        BASE_URL,
        endpoint,
        queryParams,
      ),
    );
    client.headers.set('Content-Type', 'application/json');
    final response = await client.close();
    if (response.statusCode == 200) {
      return await response.transform(Utf8Decoder()).first;
    }
  }
}
