import 'package:dio/dio.dart';

abstract class AppApiType {
  Future<Response> fetchData();
}
