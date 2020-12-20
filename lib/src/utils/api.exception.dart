class ApiException implements Exception {
  final String error;
  final String? description;

  const ApiException({
    this.error = 'Unknown error related to API requests',
    this.description,
  });
}
