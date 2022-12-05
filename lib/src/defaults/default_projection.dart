import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:independent_map/independent_map.dart';
import 'package:independent_map/src/exceptions/not_constrained_projection.dart';

class DefaultProjection extends Projection {
  DefaultProjection(this.mapController);

  final MapController mapController;

  BoxConstraints? constraints;

  double _screenCenterX = 0;
  double _screenCenterY = 0;

  @override
  GeoPoint projectionPointToGeoPoint(ProjectionPoint projectionPoint) {
    final x = projectionPoint.x;
    final y = projectionPoint.y;

    //coordinate shift
    final xx = x - 0.5;
    final yy = 0.5 - y;

    final lat = 90.0 - 360.0 * atan(exp(-yy * 2.0 * pi)) / pi;
    final lng = 360.0 * xx;

    return GeoPoint(latitude: lat, longitude: lng);
  }

  @override
  ProjectionPoint geoPointToProjectionPoint(GeoPoint geoPoint) {
    final lng = geoPoint.longitude;
    final lat = geoPoint.latitude;
// get x value
    double x = (lng + 180) / 360;

// convert from degrees to radians
    double latRad = lat * pi / 180;

// get y value
    double mercN = log(tan((pi / 4) + (latRad / 2)));
    double y = (1 / 2) - (1 * mercN / (2 * pi));
    print("tile index x:$x ,$y");
    return ProjectionPoint(x, y);
  }

  @override
  Offset geoPointToOffset(GeoPoint geoPoint) {
    if (constraints == null) {
      throw NotConstrainedProjection(
          this, 'Need BoxContstraints to calculate screen Offset');
    }
    final scale = pow(2.0, mapController.getZoom());

    final norm = geoPointToProjectionPoint(mapController.getMapCenter());

    final l = geoPointToProjectionPoint(geoPoint);

    final dx = l.x - norm.x;
    final dy = l.y - norm.y;

    final s = mapController.getTileSize() * scale;

    return Offset(_screenCenterX + dx * s, _screenCenterY + dy * s);
  }

  @override
  GeoPoint offsetToGeoPoint(Offset offset) {
    if (constraints == null) {
      throw NotConstrainedProjection(this,
          'Need BoxContstraints to calculate GeoPoint from screen Offset');
    }
    final scale = pow(2.0, mapController.getZoom());
    final norm = geoPointToProjectionPoint(mapController.getMapCenter());

    final dx = _screenCenterX - offset.dx;
    final dy = _screenCenterY - offset.dy;

    final x = norm.x - (dx / mapController.getTileSize()) / scale;
    final y = norm.y - (dy / mapController.getTileSize()) / scale;

    final mon = ProjectionPoint(x, y);
    final location = projectionPointToGeoPoint(mon);

    return location;
  }

  @override
  void setConstraints(BoxConstraints constraints) {
    this.constraints = constraints;
    _screenCenterX = constraints.biggest.width / 2.0;
    _screenCenterY = constraints.biggest.height / 2.0;
  }
}
