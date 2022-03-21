import 'package:flutter_course_pagination/models/airline.dart';

class PassengerDataModel {
  final String id;
  final String name;
  final int? trip;
  final List<AirlineModel> airline;

  const PassengerDataModel({
    required this.id,
    required this.name,
    required this.trip,
    required this.airline,
  });

  factory PassengerDataModel.fromJson(Map<String, dynamic> json) {
    return PassengerDataModel(
      id: json["_id"],
      name: json["name"],
      trip: json["trips"],
      airline: List<AirlineModel>.from(
          json["airline"].map((e) => AirlineModel.fromJson(e))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "trips": trip,
      };
}
