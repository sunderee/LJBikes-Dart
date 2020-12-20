class ApiException implements Exception {
  final String error;
  final String? description;

  const ApiException({
    required this.error,
    this.description,
  });
}
