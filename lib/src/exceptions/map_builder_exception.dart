import 'dart:core';

import 'package:independent_map/src/exceptions/independent_map_exception.dart';

class MapBuilderException extends IndependentMapException {
  const MapBuilderException(super.message);

  @override
  String toString() {
    return "${super.toString()} MapBuilderException: $message";
  }
}
