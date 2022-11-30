import 'package:independent_map/src/data_objects/geo_point.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:independent_map/src/map_objects/marker.dart';

class DefaultMarker extends Marker {
  final String _key;

  final Widget _markerWidget;

  final GeoPoint _position;

  const DefaultMarker(this._key, this._markerWidget, this._position);

  @override
  String get key => _key;

  @override
  Widget get markerWidget => _markerWidget;

  @override
  GeoPoint get position => _position;
}
