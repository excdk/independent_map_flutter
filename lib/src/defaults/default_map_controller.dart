import 'dart:ui';

import 'package:independent_map/independent_map.dart';

class DefaultMapController extends MapController {
  DefaultMapController(this._centerLocation, this._zoom, this._projection,
      {this.maxZoom = 16, this.minZoom = 0, this.tileSize = 256});

  GeoPoint _centerLocation;
  final Projection _projection;
  double _zoom;
  int tileSize;
  final double maxZoom;
  final double minZoom;
  @override
  GeoPoint getMapCenter() {
    return _centerLocation;
  }

  @override
  void setMapCenter(GeoPoint geoPoint) {
    _centerLocation = geoPoint;
  }

  @override
  Projection getProjection() {
    return _projection;
  }

  @override
  double getZoom() {
    return _zoom;
  }

  @override
  void setZoom(double zoom) {
    final zoomValueCurrent = _zoom;
    if (true) {
      var zoomValueChanged = zoomValueCurrent + zoom;
      if (zoomValueChanged > maxZoom) {
        zoomValueChanged = maxZoom * 1.0;
      }
      if (zoomValueChanged < minZoom) {
        zoomValueChanged = minZoom * 1.0;
      }
      _zoom = zoomValueChanged;
    }
  }

  @override
  int getTileSize() {
    return tileSize;
  }

  @override
  void setTileSize(int size) {
    tileSize = size;
  }

  @override
  GeoPoint toGeoPoint(Offset offset) {
    // TODO: implement toGeoPoint
    throw UnimplementedError();
  }

  @override
  Offset toOffset(GeoPoint geoPoint) {
    // TODO: implement toOffset
    throw UnimplementedError();
  }
}
