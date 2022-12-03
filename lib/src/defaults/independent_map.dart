import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:independent_map/src/defaults/default_dragger.dart';
import 'package:independent_map/src/interfaces/dragger.dart';
import 'package:independent_map/src/interfaces/independent_map_abstract.dart';
import 'package:independent_map/src/interfaces/map_state_notifier.dart';
import 'package:independent_map/src/interfaces/map_state_subscriber.dart';
import 'package:independent_map/src/interfaces/projection.dart';
import 'package:independent_map/src/map_objects/one_point_geo_object.dart';
import 'package:independent_map/src/interfaces/map_controller.dart';

import '../data_objects/tile_index.dart';

class IndependentMap extends IndependentMapAbstract {
  final MapController _mapController;
  final Projection _projection;
  final Dragger _dragger;
  final List<MapStateSubscriber> _subscribers = [];

  IndependentMap(this._mapController, this._projection, this._dragger) {
    _dragger.onEventCallbackRegister(notifySubscribers);
  }

  @override
  MapController getMapController() {
    return _mapController;
  }

  @override
  void addOnePointGeoObjects(List<OnePointGeoObect> markers) {
    // TODO: implement addMarkers
  }

  @override
  void removeOnePointGeoObjects(List<OnePointGeoObect> markers) {
    // TODO: implement removeMarkers
  }

  @override
  List<Widget> getMarkerWidgets() {
    // TODO: implement getMarkerWidgets
    throw UnimplementedError();
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
