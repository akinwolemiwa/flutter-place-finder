import 'package:flutter/cupertino.dart';

class Place {
  final String name;
  final String placeId;
  final String photoURL;
  final double latitude;
  final double longitude;

  Place({
    required this.name,
    required this.placeId,
    required this.latitude,
    required this.longitude,
    required this.photoURL,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    final location = json['geometry']['location'];
    Iterable photos = json['photos'];

    // calling from json
    // parsing nested objects (REST API)
    return Place(
      name: json['name'],
      placeId: json['place_id'],
      latitude: location['lat'],
      longitude: location['lng'],
      photoURL: photos.isEmpty
          ? Image.network(
              'https://www.pinclipart.com/picdir/middle/545-5450392_transparent-location-clipart-png-location-map-clip-art.png')
          : photos.first['photo_reference'],
    );
  }
}
