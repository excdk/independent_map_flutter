import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:independent_map/independent_map.dart';

late IndependentMapAbstract independentMap;

class MapElement extends StatefulWidget {
  const MapElement({super.key});

  @override
  State<MapElement> createState() => _MapElementState();
}

class _MapElementState extends State<MapElement> implements MapStateSubscriber {
  @override
  void notify() {
    setState(() {});
  }

  @override
  void initState() {
    independentMap = IndependentMapFactory.buildDefault(
        centerLocation:
            const GeoPoint(latitude: 55.751667, longitude: 37.617778),
        initialZoom: 15);
    independentMap.subscribe(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MapGridBuilder(
        independentMap: independentMap,
        builder: ((context) {
          return GestureDetector(
            onScaleStart: independentMap.getDragger().onScaleStart,
            onScaleUpdate: independentMap.getDragger().onScaleUpdate,
            onScaleEnd: independentMap.getDragger().onScaleStop,
            child: GridTileLayer(
              builder: ((context, layerCoordsData) {
                log("${layerCoordsData.x}, ${layerCoordsData.y}, ${layerCoordsData.z}");
                return CachedNetworkImage(
                  imageUrl:
                      "http://a.tile.openstreetmap.fr/hot/${layerCoordsData.z}/${layerCoordsData.x}/${layerCoordsData.y}.png",
                  fit: BoxFit.cover,
                );
              }),
            ),
          );
        }));
  }
}
