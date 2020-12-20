import 'package:ljbikes/src/api/api.model.dart';
import 'package:ljbikes/src/api/api.repository.dart';

final ApiRepository _repository = ApiRepository.instance;

Future<List<StandsModel>?> retrieveAllStands() async =>
    _repository.retrieveAllStands();
