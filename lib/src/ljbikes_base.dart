import 'package:ljbikes/src/api/api.model.dart';
import 'package:ljbikes/src/api/api.repository.dart';

class LJBikesBase {
  static final LJBikesBase instance = LJBikesBase._();
  late final ApiRepository _repository;

  LJBikesBase._() : _repository = ApiRepository.instance;

  Future<List<StandsModel>?> retrieveAllStands() async =>
      _repository.retrieveAllStands();
}
