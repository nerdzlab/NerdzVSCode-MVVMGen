import 'package:dio/dio.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/business_layer/network/abstract/app_api_type.dart';

import '../dio_client.dart';
import 'endpoints.dart';

final class UserApi extends AppApiType {
  UserApi({required this.dioClient});

  final DioClient dioClient;

  @override
  Future<Response> fetchData() async {
    try {
      final Response response = await dioClient.post(Endpoints.someEndpoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
