import 'package:flutter/material.dart';
import 'package:independent_map/independent_map.dart';

abstract class OnePointGeoObject {
  const OnePointGeoObject();

  abstract final String key;

  abstract final GeoPoint position;

  abstract final Widget child;
}
