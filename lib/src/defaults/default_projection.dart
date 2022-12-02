import 'dart:math';
import 'dart:ui';

import 'package:independent_map/independent_map.dart';

class DefaultProjection extends Projection {
  @override
  GeoPoint tileIndexToGeoPoint(TileIndex tileIndex) {
    final x = tileIndex.x;
    final y = tileIndex.y;

    final xx = x - 0.5;
    final yy = 0.5 - y;

    final lat = 90.0 - 360.0 * atan(exp(-yy * 2.0 * pi)) / pi;
    final lng = 360.0 * xx;

    return GeoPoint(latitude: lat, longitude: lng);
  }

  @override
  TileIndex geoPointToTileIndex(GeoPoint geoPoint) {
// // get x value
    final lng = geoPoint.longitude;
    final lat = geoPoint.latitude;

    double x = (lng + 180) / 360;

// // convert from degrees to radians
    double latRad = lat * pi / 180;

// // get y value
    double mercN = log(tan((pi / 4) + (latRad / 2)));
    double y = (1 / 2) - (1 * mercN / (2 * pi));

    return TileIndex(x, y);
  }

  @override
  Offset geoPointToOffset(GeoPoint geoPoint) {
    // TODO: implement geoPointToOffset
    throw UnimplementedError();
  }

  @override
  GeoPoint offsetToGeoPoint(Offset offset) {
    // TODO: implement offsetToGeoPoint
    throw UnimplementedError();
  }
}
