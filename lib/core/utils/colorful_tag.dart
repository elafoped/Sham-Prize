import 'dart:ui';

import 'package:flutter/material.dart';

Color getPlaceColor(String? Place) {
  if (Place == "دمشق") {
    return Colors.green;
  } else if (Place == "حماه") {
    return Colors.red;
  } else if (Place == "القنيطرة") {
    return Colors.blueAccent;
  } else if (Place == "درعا") {
    return Colors.amberAccent;
  } else if (Place == "حلب") {
    return Colors.cyanAccent;
  } else if (Place == "اللاذقية") {
    return Colors.deepPurpleAccent;
  } else if (Place == "الحسكة") {
    return Colors.indigoAccent;
  }
  return Colors.black38;
}
