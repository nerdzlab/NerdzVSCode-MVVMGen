import 'package:dio/dio.dart';

import '../../data_layer/models/error_response.dart';

class ErrorException implements Exception {
  late String message;
  late int statusCode;
  Map<String, dynamic> errors = {};

  ErrorException.fromDioError(DioException dioError) {
    statusCode = dioError.response?.statusCode ?? 1001;

    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response,
        );
        errors = _handleErrors(
          dioError.response,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
      default:
        final error = dioError.message;
        if (error != null &&
            (error.contains('SocketException') ||
                error.contains('The connection errored'))) {
          message = 'No Internet';
          break;
        }

        message = "Something went wrong";
        break;
    }
  }

  ErrorException.fromTypeError(dynamic typeError) {
    statusCode = 1001;

    message = typeError.toString();

    errors = {};
  }

  String _handleError(dynamic error) {
    final errorResponse = error as Response?;
    final errorData = error?.data;

    if (errorData is Map<String, dynamic>) {
      final errorMessage = ErrorResponse.fromJson(errorData).message;
      return errorMessage ?? errorResponse?.statusMessage ?? '';
    } else {
      final statusMessage = errorResponse?.statusMessage;

      if (statusMessage != null) {
        return statusMessage;
      } else {
        switch (statusCode) {
          case 400:
            return 'Bad request';
          case 401:
            return 'Unauthorized';
          case 403:
            return 'Forbidden';
          case 422:
            return 'Validate exception';
          case 429:
            return 'Too many attempts';
          case 500:
            return 'Internal server error';
          case 502:
            return 'Bad gateway';
          default:
            return 'Oops, something went wrong';
        }
      }
    }
  }

  Map<String, dynamic> _handleErrors(dynamic error) {
    final errorData = error?.data;

    final errorMessage = ErrorResponse.fromJson(errorData).errors;

    return errorMessage ?? {"errors": ''};
  }

  @override
  String toString() => message;
}
