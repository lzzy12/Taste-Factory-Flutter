import 'package:flutter/material.dart';

class SettingsData {
  bool onlyGlutenFree;
  bool onlyIsVegan;
  bool onlyLactoseFree;

  SettingsData(
      {@required this.onlyGlutenFree,
      @required this.onlyIsVegan,
      @required this.onlyLactoseFree});

  SettingsData.all(bool value)
      : onlyIsVegan = value,
        onlyGlutenFree = value,
        onlyLactoseFree = value;

  SettingsData.from(SettingsData data)
      : onlyIsVegan = data.onlyIsVegan,
        onlyGlutenFree = data.onlyGlutenFree,
        onlyLactoseFree = data.onlyLactoseFree;

  Map<String, bool> toMap() {
    return {
      'isGlutenFree': onlyGlutenFree,
      'isVegan': onlyIsVegan,
      'isLactoseFree': onlyLactoseFree
    };
  }
}
