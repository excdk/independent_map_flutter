import 'package:flutter/widgets.dart';
import 'package:independent_map/independent_map.dart';
import 'package:independent_map/src/interfaces/map_controller.dart';

class MapGridBuilder extends InheritedWidget {
  MapGridBuilder({
    required this.independentMap,
    required this.builder,
    super.key,
  }) : super(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          independentMap.getProjection().setConstraints(constraints);
          return builder.call(context);
        }));

  final IndependentMapAbstract independentMap;

  final Widget Function(
    BuildContext context,
  ) builder;

  @override
  bool updateShouldNotify(covariant MapGridBuilder oldWidget) {
    return oldWidget.independentMap.getMapController().getTileSize() !=
            independentMap.getMapController().getTileSize() ||
        oldWidget.independentMap.getMapController() !=
            independentMap.getMapController() ||
        oldWidget.builder != builder;
  }
}
