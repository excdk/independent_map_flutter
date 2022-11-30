abstract class IndependentMapException implements Exception {
  final String message;

  const IndependentMapException(this.message);

  @override
  String toString() {
    return "IndependentMapException - ";
  }
}
