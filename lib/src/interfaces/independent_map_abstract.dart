import 'package:flutter/widgets.dart';
import 'package:independent_map/independent_map.dart';

import '../map_objects/marker.dart';

abstract class IndependentMapAbstract {
  MapController getMapController();

  void addMarkers(List<Marker> markers);

  void removeMarkers(List<Marker> markers);

  List<Widget> getMarkerWidgets();

  Dragger getDragger();
}
