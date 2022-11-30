import 'package:flutter/material.dart';
import 'package:independent_map/src/interfaces/projection.dart';

import '../data_objects/geo_point.dart';

abstract class MapController {
  double getZoom();

  void setZoom(double zoom);

  GeoPoint getMapCenter();

  void setMapCenter(GeoPoint geoPoint);

  Projection getProjection();

  GeoPoint toGeoPoint(Offset offset);

  Offset toOffset(GeoPoint geoPoint);

  int getTileSize();

  void setTileSize(int size);
}
