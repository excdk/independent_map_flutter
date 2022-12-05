import 'package:independent_map/independent_map.dart';

class IndependentMapFactory {
  static IndependentMap buildDefault({
    required GeoPoint centerLocation,
    required double initialZoom,
    double maxZoom = 16,
    double minZoom = 0,
    int tileSize = 256,
  }) {
    final mapController = DefaultMapController(
        //const ,
        centerLocation,
        initialZoom,
        maxZoom: maxZoom,
        minZoom: minZoom,
        tileSize: tileSize);
    final projection = DefaultProjection(mapController);
    final dragger = DefaultDragger(mapController, projection);
    return IndependentMap(mapController, projection, dragger);
  }
}
