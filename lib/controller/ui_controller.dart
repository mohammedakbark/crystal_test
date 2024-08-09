import 'package:crystal_test/utils/images.dart';
import 'package:flutter/material.dart';

class UiController with ChangeNotifier {
  int currentIndex = 0;

  void onChangeScreen(selectedIndex) {
    currentIndex = selectedIndex;
    notifyListeners();
  }

  static const List<String> slides = [
    Images.homeSlide1,
    Images.homeSlide1,
    Images.homeSlide1,
  ];

  static List<Map<String, dynamic>> listViewItems = [
    {
      'image': Images.listOfImages[0],
      'title': 'Electric 100 Neo',
      'start': '500',
      'end': '700'
    },
    {
      'image': Images.listOfImages[1],
      'title': 'Activa 4G',
      'start': '500',
      'end': '700'
    },
    {
      'image': Images.listOfImages[2],
      'title': 'Scooter',
      'start': '500',
      'end': '700'
    },
    {
      'image': Images.listOfImages[3],
      'title': 'Active 5G',
      'start': '500',
      'end': '1000'
    },
    {
      'image': Images.listOfImages[4],
      'title': 'TVS ',
      'start': '500',
      'end': '900'
    }
  ];
}
