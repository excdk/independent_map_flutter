import 'package:independent_map/src/exceptions/independent_map_exception.dart';

class IncorrectDataException extends IndependentMapException {
  const IncorrectDataException(super.message);

  @override
  String toString() {
    return "${super.toString()} IncorrectDataException: $message";
  }
}
