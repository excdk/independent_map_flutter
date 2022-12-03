import 'package:independent_map/src/interfaces/projection.dart';

import '../data_objects/geo_point.dart';

abstract class MapController {
  double getZoom();

  int getTileSize();

  GeoPoint getMapCenter();

  void changeZoomBy(double zoom);

  void setMapCenter(GeoPoint geoPoint);
}
