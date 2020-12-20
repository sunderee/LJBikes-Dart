import 'dart:convert';

import 'package:ljbikes/src/api/api.model.dart';
import 'package:ljbikes/src/api/api.provider.dart';
import 'package:ljbikes/src/utils/api.exception.dart';

abstract class _IApiRepository {
  Future<List<StandsModel>?> retrieveAllStands();
}

class ApiRepository implements _IApiRepository {
  static final ApiRepository instance = ApiRepository._();
  final _provider = ApiProvider();

  ApiRepository._();

  @override
  Future<List<StandsModel>?> retrieveAllStands() async {
    final rawResponse = await _provider.makeGetRequest(
      'vls/v3/stations',
      queryParams: {
        'apiKey': 'b4ccb80c0cd364a9581b299dfa28e7648aca36ef',
        'contract': 'ljubljana',
      },
    );
    if (rawResponse != null) {
      return (jsonDecode(rawResponse) as List<dynamic>)
          .map((dynamic element) => StandsModel.fromJson(element))
          .toList();
    }
    throw ApiException(error: 'Unknown API error');
  }
}
