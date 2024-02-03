import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';
import '../helpers/db_helpers.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    Place newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: null,
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DatabaseHelper.insert(
      'places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
      },
    );
  }

  Future<void> fetchAndGetData() async {
    var dataBaseItems = await DatabaseHelper.getData('places');
    _items = dataBaseItems
        .map(
          (e) => Place(
            id: e['id'],
            title: e['title'],
            location: null,
            image: File(
              e['image'].path,
            ),
          ),
        )
        .toList();
  }
}
