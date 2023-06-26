import 'package:dio/dio.dart';

class DioProvider{
  final Dio dio;
  final String publicKey;
  final String privateKey;

  const DioProvider({
    required this.dio,
    required this.publicKey,
    required this.privateKey
  });
}