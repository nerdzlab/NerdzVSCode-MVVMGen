import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/business_layer/network/abstract/app_api_type.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/data_layer/repositories/auth_storage.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../network/api/user_api.dart';
import '../network/dio_client.dart';
import '../services/navigation_service.dart';

final GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Talker());
  locator.registerLazySingleton(() => AuthStorage());

  locator.registerSingleton(Dio());
  locator.registerSingleton(DioClient(locator<Dio>()));
  locator
      .registerSingleton<AppApiType>(UserApi(dioClient: locator<DioClient>()));
}
