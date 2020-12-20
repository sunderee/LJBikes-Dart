import 'package:ljbikes/src/api/api.model.dart';
import 'package:ljbikes/src/api/api.provider.dart';
import 'package:ljbikes/src/utils/api.const.dart';
import 'package:ljbikes/src/utils/api.exception.dart';

abstract class _IApiRepository {
  Future<List<StandsModel>?> retrieveAllStands();
}

class ApiRepository implements _IApiRepository {
  static final ApiRepository instance = ApiRepository._();
  final _provider = ApiProvider(BASE_URL);

  ApiRepository._();

  @override
  Future<List<StandsModel>?> retrieveAllStands() async {
    try {
      return (await _provider.makeGetRequest(
        'vls/v3/stations',
        queryParams: {
          'apiKey': 'b4ccb80c0cd364a9581b299dfa28e7648aca36ef',
          'contract': 'ljubljana',
        },
      ) as List<dynamic>)
          .map((dynamic element) => StandsModel.fromJson(element))
          .toList();
    } on ApiException catch (exception) {
      print('ApiException: ${exception.error}\n${exception.description}');
      return null;
    }
  }
}
