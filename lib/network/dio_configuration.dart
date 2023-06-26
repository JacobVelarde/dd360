
import 'package:dio/dio.dart';

Dio getDio(Map<String, dynamic> appConfig){
  final baseOptions = BaseOptions(
      baseUrl: appConfig['base_url'],
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60)
  );

  return Dio(baseOptions);
}