import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    _items.add(
      Place(
          id: DateTime.now().toString(),
          title: pickedTitle,
          location: null,
          image: pickedImage),
    );
  }
}
