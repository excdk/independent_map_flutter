import 'package:example/ui/components/map_button.dart';
import 'package:example/ui/map/map_element.dart';
import 'package:flutter/material.dart';
import 'package:independent_map/independent_map.dart';

import '../marker.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const MapElement(),
          Positioned(
              left: 16,
              top: MediaQuery.of(context).size.height * 0.3,
              child: MapButton(
                Icons.add_box_outlined,
                onTap: () {
                  final markerPosition =
                      independentMap.getMapController().getMapCenter();
                  final marker = DefaultMarker("one marker", Marker(
                    onTap: () {
                      print("marker tapped at ${markerPosition.toString()}");
                    },
                  ), markerPosition);
                  independentMap.addOnePointGeoObjects([marker]);
                },
              )),
          Positioned(
              right: 16,
              top: MediaQuery.of(context).size.height * 0.3,
              child: MapButton(
                Icons.zoom_in,
                onTap: () {
                  independentMap.getMapController().changeZoomBy(1);
                  independentMap.notifySubscribers();
                },
              )),
          Positioned(
            right: 16,
            top: MediaQuery.of(context).size.height * 0.3 + 42 + 16,
            child: MapButton(
              Icons.zoom_out,
              onTap: () {
                independentMap.getMapController().changeZoomBy(-1);
                independentMap.notifySubscribers();
              },
            ),
          )
        ],
      ),
    );
  }
}
