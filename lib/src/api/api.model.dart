import 'package:ljbikes/src/utils/pair.dart';

abstract class _ApiBaseModel {
  const _ApiBaseModel();

  dynamic fromJson(dynamic json);
  Map<String, dynamic> toJson();
}

class StandsModel extends _ApiBaseModel {
  final int? id;
  final String? name;
  final String? address;
  final Pair<double, double>? location;
  final int? capacity;
  final int? availableBikes;

  const StandsModel({
    this.id,
    this.name,
    this.address,
    this.location,
    this.capacity,
    this.availableBikes,
  });

  @override
  StandsModel fromJson(dynamic json) => StandsModel(
        id: json['number'],
        name: json['name'],
        address: '${json['address']}, Ljubljana, Slovenia',
        location: Pair<double, double>(
          json['position']['latitude'],
          json['position']['longitude'],
        ),
        capacity: json['totalStands']['capacity'],
        availableBikes: json['totalStands']['bikes'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': this.id,
        'location': '${this.name}: ${this.address}',
        'coordinates': [
          this.location?.first,
          this.location?.second,
        ],
        'capacity': this.capacity,
        'bikes': this.availableBikes,
      };
}
