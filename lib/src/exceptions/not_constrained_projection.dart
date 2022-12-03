import 'package:independent_map/src/exceptions/independent_map_exception.dart';

import '../interfaces/projection.dart';

class NotConstrainedProjection extends IndependentMapException {
  NotConstrainedProjection(this.projectionInstance, super.message);
  final Projection projectionInstance;

  @override
  String toString() {
    return "${super.toString()} NotConstrainedProjection ( projection: ${projectionInstance.toString()} ), use Projection.setConstraints(BoxConstraints) to set constraints: $message";
  }
}
