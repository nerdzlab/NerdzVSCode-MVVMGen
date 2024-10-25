import 'package:dio/dio.dart';

typedef ErrorMessageCallback = void Function(String errorMessage);
typedef StringCallback = void Function(String text);
typedef StringNullCallback = void Function(String? text);
typedef IntCallback = void Function(int value);
typedef BoolCallback = void Function(bool value);
typedef BoolOptionalCallback = void Function(bool? value);
typedef DoubleCallback = void Function(double value);
typedef ResponseBodyCallback = void Function(ResponseBody resp);
typedef FunctionCallback = void Function(Future<dynamic> Function());
