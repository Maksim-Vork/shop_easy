class AppException implements Exception {
  final String error;

  AppException({required this.error});

  @override
  String toString() => error;
}
