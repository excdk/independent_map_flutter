import 'package:flutter/widgets.dart';
import 'package:independent_map/src/interfaces/map_controller.dart';

class MapGridBuilder extends InheritedWidget {
  MapGridBuilder(
      {required this.mapController, required this.builder, super.key})
      : super(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return builder.call(context, mapController);
        }));

  final MapController mapController;

  final Widget Function(
    BuildContext context,
    MapController transformer,
  ) builder;

  @override
  bool updateShouldNotify(covariant MapGridBuilder oldWidget) {
    return oldWidget.mapController.getTileSize() !=
            mapController.getTileSize() ||
        oldWidget.mapController != mapController ||
        oldWidget.builder != builder;
  }
}
