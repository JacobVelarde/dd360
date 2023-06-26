

import 'dart:io';

import 'package:dio/dio.dart';

class BaseBloc{

  bool isErrorNetwork(DioException error){
    switch (error.type){

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return true;
      case DioExceptionType.badResponse:
        if (
          error.response!.statusCode == 404 ||
          error.response!.statusCode == 500 ||
          error.response!.statusCode == 502 ||
          error.response!.statusCode == 503
        ){
          return true;
        }else{
          return false;
        }
    }
  }

  Future<bool> hastInternetConnection() async {
    try{
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty){
        return true;
      }else{
        return false;
      }
    } on SocketException catch (_){
      return false;
    }
  }
}