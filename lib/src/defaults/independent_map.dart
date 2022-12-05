import 'package:flutter/widgets.dart';
import 'package:independent_map/src/interfaces/dragger.dart';
import 'package:independent_map/src/interfaces/independent_map_abstract.dart';
import 'package:independent_map/src/interfaces/map_state_subscriber.dart';
import 'package:independent_map/src/interfaces/projection.dart';
import 'package:independent_map/src/map_objects/one_point_geo_object.dart';
import 'package:independent_map/src/interfaces/map_controller.dart';

class IndependentMap extends IndependentMapAbstract {
  final MapController _mapController;
  final Projection _projection;
  final Dragger _dragger;
  final List<MapStateSubscriber> _subscribers = [];
  final List<Widget> _onePointGeoObjectsWidgets = [];
  final List<OnePointGeoObject> _onePointGeoObjects = [];

  IndependentMap(this._mapController, this._projection, this._dragger) {
    _dragger.onEventCallbackRegister(() {
      _recreateMapObjects();
      notifySubscribers();
    });
    _mapController.onEventCallbackRegister(() {
      _recreateMapObjects();
      notifySubscribers();
    });
  }

  @override
  MapController getMapController() {
    return _mapController;
  }

  Widget _prepareOnePointGeoObectPositionedOffset(Widget child, Offset offset) {
    return Positioned(
      left: offset.dx - 24,
      top: offset.dy - 24,
      child: child,
    );
  }

  void _addOnePointGeoObjectWidgets(
      {required List<OnePointGeoObject> geoObjects}) {
    for (OnePointGeoObject geoObject in geoObjects) {
      final offset = _projection.geoPointToOffset(geoObject.position);
      _onePointGeoObjectsWidgets.add(
          _prepareOnePointGeoObectPositionedOffset(geoObject.child, offset));
    }
  }

  void _recreateMapObjects() {
    _recreateOnePointGeoObjects();
  }

  void _recreateOnePointGeoObjects() {
    _onePointGeoObjectsWidgets.clear();
    _addOnePointGeoObjectWidgets(geoObjects: _onePointGeoObjects);
  }

  @override
  void addOnePointGeoObjects(List<OnePointGeoObject> geoObjects) {
    _addOnePointGeoObjectWidgets(geoObjects: geoObjects);
    _onePointGeoObjects.addAll(geoObjects);
    notifySubscribers();
  }

  @override
  void removeOnePointGeoObjects(List<OnePointGeoObject> geoObjects) {
    for (var geoObject in geoObjects) {
      final index = _onePointGeoObjects.indexOf(geoObject);
      _onePointGeoObjects.removeAt(index);
      _onePointGeoObjectsWidgets.removeAt(index);
    }
  }

  @override
  List<Widget> getOnePointGeoObjectsWidgets() {
    return _onePointGeoObjectsWidgets;
  }

  @override
  void subscribe(MapStateSubscriber mapStateSubscriber) {
    _subscribers.add(mapStateSubscriber);
  }

  @override
  void unsubscribe(MapStateSubscriber mapStateSubscriber) {
    _subscribers.remove(mapStateSubscriber);
  }

  @override
  void notifySubscribers() {
    for (var subscriber in _subscribers) {
      subscriber.notify();
    }
  }

  @override
  Dragger getDragger() {
    return _dragger;
  }

  @override
  Projection getProjection() {
    return _projection;
  }
}
