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

    // calling from json
    return Place(
      name: json['name'],
      placeId: json['place_id'],
      latitude: location['lat'],
      longitude: location['lng'],
      photoURL: (json['photos'][0])['photo reference'],
    );
  }
}
