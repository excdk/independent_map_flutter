class GeoPoint {
  final double longitude;

  final double latitude;

  const GeoPoint({required this.latitude, required this.longitude});

  @override
  String toString() {
    return "POINT ($longitude $latitude)";
  }
}
