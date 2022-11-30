import 'package:flutter/material.dart';
import 'package:independent_map/independent_map.dart';

abstract class Marker {
  const Marker();
  abstract final String key;
  abstract final GeoPoint position;
  abstract final Widget markerWidget;
}
