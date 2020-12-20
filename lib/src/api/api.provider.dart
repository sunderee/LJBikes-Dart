import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ljbikes/src/utils/api.exception.dart';

class ApiProvider {
  final String _baseURL;

  const ApiProvider(this._baseURL);

  Future<dynamic>? makeGetRequest(
    String endpoint, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    final http.Response response = await http.get(
      Uri.https(_baseURL, endpoint, queryParams),
      headers: headers,
    );

    return response.statusCode == 200
        ? json.decode(response.body)
        : throw ApiException(
            error: 'Response returned ${response.statusCode}',
            description: response.body,
          );
  }
}
