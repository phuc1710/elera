class ApiError {
  ApiError({
    this.statusCode,
    this.errorMessage,
  });

  int? statusCode;
  String? errorMessage;
}
