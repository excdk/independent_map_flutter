import 'package:flutter/widgets.dart';
import 'package:independent_map/independent_map.dart';
import 'package:independent_map/src/interfaces/map_state_notifier.dart';

import '../map_objects/one_point_geo_object.dart';

abstract class IndependentMapAbstract implements MapStateNotifier {
  MapController getMapController();

  Projection getProjection();

  void addOnePointGeoObjects(List<OnePointGeoObect> markers);

  void removeOnePointGeoObjects(List<OnePointGeoObect> markers);

  List<Widget> getMarkerWidgets();

  Dragger getDragger();
}
