import 'dart:io';

class PlaceLocation {
  final double latittude;
  final double longitude;
  final String? address;

  PlaceLocation({
    required this.latittude,
    required this.longitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
