import 'package:flutter/material.dart';
import 'package:place_finder/services/webServices.dart';
import 'package:place_finder/viewModel/placeViewModel.dart';

class PlaceListViewModel extends ChangeNotifier {
  var places = <PlaceViewModel>[];

  Future<void> fetchPlaces(
      String keyword, double latitude, double longitude) async {
    final services = await WebService()
        .fetchPlacesbyKeywordAndPosition(keyword, latitude, longitude);
    this.places = services.map((place) => PlaceViewModel(place)).toList();

    notifyListeners();
  }
}
