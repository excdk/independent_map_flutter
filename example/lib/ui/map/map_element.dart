import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:independent_map/independent_map.dart';

late IndependentMap independentMap;

class MapElement extends StatefulWidget {
  const MapElement({super.key});

  @override
  State<MapElement> createState() => _MapElementState();
}

class _MapElementState extends State<MapElement> implements MapStateSubscriber {
  @override
  void notify() {
    log('notified');
    setState(() {});
  }

  @override
  void initState() {
    var mapController = DefaultMapController(
        const GeoPoint(latitude: 55.751667, longitude: 37.617778),
        1,
        DefaultProjection());
    independentMap =
        IndependentMap(mapController, DefaultDragger(mapController));
    independentMap.subscribe(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MapGridBuilder(
        mapController: independentMap.getMapController(),
        builder: ((context) {
          return GestureDetector(
            onScaleStart: independentMap.getDragger().onScaleStart,
            onScaleUpdate: independentMap.getDragger().onScaleUpdate,
            onScaleEnd: independentMap.getDragger().onScaleStop,
            child: GridTileLayer(
              builder: ((context, layerCoordsData) {
                print(
                    "${layerCoordsData.x}, ${layerCoordsData.y}, ${layerCoordsData.z}");
                return CachedNetworkImage(
                  imageUrl:
                      "https://www.google.com/maps/vt/pb=!1m4!1m3!1i${layerCoordsData.z}!2i${layerCoordsData.x}!3i${layerCoordsData.y}!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425",
                  fit: BoxFit.cover,
                );
              }),
            ),
          );
        }));
  }
}
