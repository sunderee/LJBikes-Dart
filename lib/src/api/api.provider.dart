import 'dart:convert';
import 'dart:io';
import 'package:ljbikes/src/utils/api.exception.dart';

import '../utils/api.exception.dart';

class ApiProvider {
  final String _baseURL;

  const ApiProvider(this._baseURL);

  Future<dynamic>? makeGetRequest(
    String endpoint, {
    Map<String, String>? queryParams,
  }) async {
    final client = await HttpClient().getUrl(
      Uri.https(
        _baseURL,
        endpoint,
        queryParams,
      ),
    );
    client.headers.set('Content-Type', 'application/json');
    final response = await client.close();
    await for (String result in response.transform(Utf8Decoder())) {
      return jsonDecode(result);
    }
    throw ApiException(
      error: '${response.statusCode}',
      description: 'GET request failed\n$response',
    );
  }
}
