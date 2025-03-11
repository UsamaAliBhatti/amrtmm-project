class ApiResponse<T> {
  final bool status;
  final String message;
  final T? data;
  final int statusCode; // New field to capture HTTP status codes

  ApiResponse({
    required this.status,
    required this.message,
    this.data,
    required this.statusCode,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
    int statusCode,
  ) {
    return ApiResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      statusCode: statusCode,
    );
  }
}
