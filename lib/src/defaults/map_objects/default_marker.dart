import 'package:flutter/widgets.dart';
import 'package:independent_map/src/data_objects/geo_point.dart';
import 'package:independent_map/src/map_objects/one_point_geo_object.dart';

class DefaultMarker extends OnePointGeoObect {
  final String _key;

  final Widget _markerWidget;

  final GeoPoint _position;

  const DefaultMarker(this._key, this._markerWidget, this._position);

  @override
  String get key => _key;

  @override
  Widget get child => _markerWidget;

  @override
  GeoPoint get position => _position;
}
