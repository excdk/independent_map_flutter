import 'package:independent_map/independent_map.dart';

abstract class Projection {
  GeoPoint toGeoPoint(TileIndex tileIndex);

  TileIndex toTileIndex(GeoPoint geoPoint);
}
