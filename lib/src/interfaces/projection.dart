import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:independent_map/independent_map.dart';

abstract class Projection {
  void setConstraints(BoxConstraints constraints);

  GeoPoint offsetToGeoPoint(Offset offset);

  Offset geoPointToOffset(GeoPoint geoPoint);

  GeoPoint tileIndexToGeoPoint(TileIndex tileIndex);

  TileIndex geoPointToTileIndex(GeoPoint geoPoint);
}
