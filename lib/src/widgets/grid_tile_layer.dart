import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:independent_map/independent_map.dart';

class GridTileLayer extends StatefulWidget {
  const GridTileLayer({super.key, required this.builder});

  final Widget Function(BuildContext context, LayerCoordsData layerCoordsData)
      builder;

  @override
  State<GridTileLayer> createState() => _GridTileLayerState();
}

class _GridTileLayerState extends State<GridTileLayer> {
  late int _tileSize;
  late IndependentMapAbstract _independentMap;

  @override
  void didChangeDependencies() {
    final mapGridBuilder =
        context.findAncestorWidgetOfExactType<MapGridBuilder>();

    if (mapGridBuilder == null) {
      throw const MapBuilderException(
          "GridTileLayer must be used inside a GridTileLayer");
    }
    _independentMap = mapGridBuilder.independentMap;
    _tileSize = _independentMap.getMapController().getTileSize();

    super.didChangeDependencies();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        final size = constraints.biggest; // размер экрана
        final projection = _independentMap.getProjection(); // проекция

        final screenWidth = size.width; //ширина экрана
        final screenHeight = size.height; //высота экрана

        final centerX = screenWidth / 2.0; //центр х
        final centerY = screenHeight / 2.0; // центр у

        final scale = pow(
            2.0,
            _independentMap
                .getMapController()
                .getZoom()); // по сути это количество тайлов по ширине

        final norm = projection.geoPointToTileIndex(
            _independentMap.getMapController().getMapCenter()); // от 0 до 1
        final ttl =
            TileIndex(norm.x * _tileSize * scale, norm.y * _tileSize * scale);

        final fixedZoom =
            (_independentMap.getMapController().getZoom() + 0.0000001)
                .toInt(); //зум в числе
        final fixedPowZoom = pow(2,
            fixedZoom); // по сути это количество тайлов по ширине с фиксированным числом зума

        final centerTileIndexX = (norm.x * fixedPowZoom)
            .floor(); // координата тайла, находящегося на данной координате
        final centerTileIndexY = (norm.y * fixedPowZoom)
            .floor(); // координата тайла, находящегося на данной координате

        final scaleValue =
            pow(2.0, (_independentMap.getMapController().getZoom() % 1));
        final tileSizeScaled = _tileSize * scaleValue;

        final numTilesX = (screenWidth / _tileSize / 2.0).ceil();
        final numTilesY = (screenHeight / _tileSize / 2.0).ceil();

        final children = <Widget>[];

        for (int i = centerTileIndexX - numTilesX;
            i <= centerTileIndexX + numTilesX;
            i++) {
          for (int j = centerTileIndexY - numTilesY;
              j <= centerTileIndexY + numTilesY;
              j++) {
            final ox = (i * tileSizeScaled) + centerX - ttl.x;
            final oy = (j * tileSizeScaled) + centerY - ttl.y;

            final child = Positioned(
                width: tileSizeScaled.ceilToDouble(),
                height: tileSizeScaled.ceilToDouble(),
                left: ox.floorToDouble(),
                top: oy.floorToDouble(),
                child: widget.builder.call(
                    context,
                    LayerCoordsData(
                        i.abs() >= scale ? (i.abs() % scale).toInt() : i.abs(),
                        j.abs() >= scale ? (j.abs() % scale).toInt() : j.abs(),
                        (_independentMap.getMapController().getZoom() +
                                0.0000001)
                            .floor())));

            children.add(child);
          }
        }

        final stack = Stack(children: children);

        return stack;
      }),
    );
  }
}
