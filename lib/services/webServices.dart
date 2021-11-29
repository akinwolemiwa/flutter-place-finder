import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:place_finder/models/placeModel.dart';
import 'package:place_finder/utils/urlHelper.dart';

class WebService {
  Future<List<Place>> fetchPlacesbyKeywordAndPosition(
      String keyword, double latitude, double longitude) async {
    final url = UrlHelper.urlForPlacesLocation(keyword, latitude, longitude);
    // call url from utils here
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final Iterable results = jsonResponse['results'];
      return results.map((place) => Place.fromJson(place)).toList();
    } else {
      throw Exception('Unable to return request');
    }
  }
}
