import 'package:independent_map/independent_map.dart';

class DefaultMapController extends MapController {
  DefaultMapController(this._centerLocation, this._zoom,
      {this.maxZoom = 16, this.minZoom = 0, this.tileSize = 256});

  GeoPoint _centerLocation;
  double _zoom;
  final int tileSize;
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
  double getZoom() {
    return _zoom;
  }

  @override
  void changeZoomBy(double zoom) {
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
}
