import 'package:independent_map/independent_map.dart';

class ZoomOutOfBoundsException extends IndependentMapException {
  const ZoomOutOfBoundsException(
      super.message, this.maxZoom, this.minZoom, this.zoomValueToSet);

  final double maxZoom;
  final double minZoom;
  final double zoomValueToSet;

  @override
  String toString() {
    return "${super.toString()} ZoomOutOfBoundsException ( maxZoom: $maxZoom, minZoom: $minZoom, zoomValueToSet: $zoomValueToSet):  $message";
  }
}
