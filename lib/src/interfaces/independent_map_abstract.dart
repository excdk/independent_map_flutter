import 'package:flutter/widgets.dart';
import 'package:independent_map/independent_map.dart';

import '../map_objects/one_point_geo_object.dart';

abstract class IndependentMapAbstract implements MapStateNotifier {
  MapController getMapController();

  Projection getProjection();

  void addOnePointGeoObjects(List<OnePointGeoObject> geoObjects);

  void removeOnePointGeoObjects(List<OnePointGeoObject> geoObjects);

  List<Widget> getOnePointGeoObjectsWidgets();

  Dragger getDragger();
}
