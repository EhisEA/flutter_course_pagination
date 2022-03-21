import 'dart:convert';

import 'package:flutter_course_pagination/models/passager.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<PassengerDataModel>> getItems({
    int page = 0,
    int limit = 20,
  }) async {
    // intaract with server
    http.Response response = await http.get(
      Uri.parse(
        "https://api.instantwebtools.net/v1/passenger?page=$page&size=$limit",
      ),
    );
    // up the data section[list] into result
    List result = jsonDecode(response.body)["data"];

    // return result
    //     .map<PassengerDataModel>(
    //       (e) => PassengerDataModel.fromJson(e),
    //     )
    //     .toList();

    // map result list into a list of our model
    return List<PassengerDataModel>.from(
      result.map(
        // make PassengerDataModel out of value[the current element]
        (value) => PassengerDataModel.fromJson(value),
      ),
    );
  }
}
