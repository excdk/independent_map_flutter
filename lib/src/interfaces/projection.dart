import 'dart:ui';

import 'package:independent_map/independent_map.dart';

abstract class Projection {
  GeoPoint offsetToGeoPoint(Offset offset);

  Offset geoPointToOffset(GeoPoint geoPoint);

  GeoPoint tileIndexToGeoPoint(TileIndex tileIndex);

  TileIndex geoPointToTileIndex(GeoPoint geoPoint);
}
