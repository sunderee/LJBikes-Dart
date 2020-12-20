import 'package:ljbikes/src/utils/pair.dart';

class StandsModel {
  int? id;
  String? name;
  String? address;
  Pair<double, double>? location;
  int? capacity;
  int? availableBikes;

  StandsModel.fromJson(dynamic json) {
    this.id = json['number'];
    this.name = json['name'];
    this.address = '${json['address']}, Ljubljana, Slovenia';
    this.location = Pair<double, double>(
      json['position']['latitude'],
      json['position']['longitude'],
    );
    this.capacity = json['totalStands']['capacity'];
    this.availableBikes = json['totalStands']['availabilities']['bikes'];
  }
}
