import 'package:independent_map/independent_map.dart';
import 'package:independent_map/src/exceptions/zoom_out_of_bounds_exception.dart';

class DefaultMapController extends MapController {
  DefaultMapController(this._centerLocation, this._zoom,
      {this.maxZoom = 16, this.minZoom = 0, this.tileSize = 256});

  void Function()? _callback;

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
    _callback?.call();
  }

  @override
  double getZoom() {
    return _zoom;
  }

  @override
  void changeZoomBy(double zoom) {
    final zoomValueCurrent = _zoom;
    var zoomValueChanged = zoomValueCurrent + zoom;
    if (zoomValueChanged > maxZoom) {
      zoomValueChanged = maxZoom * 1.0;
    }
    if (zoomValueChanged < minZoom) {
      zoomValueChanged = minZoom * 1.0;
    }
    _zoom = zoomValueChanged;
    _callback?.call();
  }

  @override
  int getTileSize() {
    return tileSize;
  }

  @override
  void onEventCallbackRegister(void Function() callback) {
    _callback = callback;
  }

  @override
  void setZoom(double zoom) {
    if (zoom >= minZoom && zoom <= maxZoom) {
      _zoom = zoom;
      _callback?.call();
    } else {
      throw ZoomOutOfBoundsException(
          "Tried to set out of bounds zoom value.", maxZoom, minZoom, zoom);
    }
  }
}
