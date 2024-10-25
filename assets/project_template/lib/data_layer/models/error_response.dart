final class ErrorResponse {
  String? message;
  Map<String, dynamic>? errors;

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors = json['errors'];
  }
}
