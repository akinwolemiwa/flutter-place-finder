import 'package:place_finder/models/placeModel.dart';

class PlaceViewModel {
  late Place _place;

  PlaceViewModel(Place place) {
    this._place = place;
  }

  String get placeId {
    return this._place.placeId;
  }

  String get name {
    return this._place.name;
  }

  double get latitude {
    return this._place.latitude;
  }

  double get longitude {
    return this._place.longitude;
  }

  String get photoURL {
    return this._place.photoURL;
  }
}
