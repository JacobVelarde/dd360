

import 'package:dio/dio.dart';
import 'package:test_dd360/src/data/utils/custom_exception.dart';

class ApiResponseHandler{

  static Map<String, dynamic> handleJsonObjectResponse(Response<dynamic> response){
    if (response.data is Map<String, dynamic>){
      return response.data;
    }else{
      throw const CustomException('The api response is not json');
    }
  }

}