import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:independent_map/independent_map.dart';

class DefaultDragger extends Dragger {
  final MapController _mapController;
  final Projection _projection;
  Function()? _callback;
  DefaultDragger(
    this._mapController,
    this._projection,
  );

  bool _isDraggingNow = false;
  double _scaleStart = 1.0;
  Offset? _dragStart;

  @override
  void drag(double dx, double dy) {
    var scale = pow(2.0, _mapController.getZoom());
    final centerLocation = _mapController.getMapCenter();
    final norm = _projection.geoPointToTileIndex(centerLocation);

    final x = norm.x - (dx / _mapController.getTileSize()) / scale;
    final y = norm.y - (dy / _mapController.getTileSize()) / scale;

    final mon = TileIndex(x, y);
    _mapController.setMapCenter(_projection.tileIndexToGeoPoint(mon));
  }

  @override
  void onScaleStart(ScaleStartDetails details) {
    _scaleStart = 1.0;
    _isDraggingNow = true;
    _dragStart = details.focalPoint;
  }

  @override
  void onScaleStop(ScaleEndDetails details) {
    _isDraggingNow = false;
  }

  @override
  void onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      _mapController.changeZoomBy(0.02);
      _callback?.call();
    } else if (scaleDiff < 0) {
      _mapController.changeZoomBy(-0.02);
      _callback?.call();
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      drag(diff.dx, diff.dy);
      _callback?.call();
    }
  }

  @override
  bool isDraggingNow() {
    return _isDraggingNow;
  }

  @override
  void onEventCallbackRegister(void Function() callback) {
    _callback = callback;
  }
}
