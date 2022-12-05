import '../data_objects/geo_point.dart';

abstract class MapController {
  double getZoom();

  void setZoom(double zoom);

  int getTileSize();

  GeoPoint getMapCenter();

  void changeZoomBy(double zoom);

  void setMapCenter(GeoPoint geoPoint);

  void onEventCallbackRegister(void Function() callback);
}
