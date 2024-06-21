import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pos_resto/core/api_client.dart';
import 'package:flutter_pos_resto/core/api_exception.dart';
import 'package:flutter_pos_resto/params/auth_param.dart';
import 'package:flutter_pos_resto/response/login_response.dart';

class AuthRepository extends ApiClient{
  Future<LoginResponse> signIn(AuthParam param) async{
    try{
      final response = await dio.post('login', data: param.toJson());
      debugPrint('Login response : ${response.data}');
      return LoginResponse.fromJson(response.data);
    }on DioException catch(e){
      if(e.response != null){
        debugPrint('Error response : ${e.response!.data}');
        var message = e.response!.data['message'][0];
        throw ApiException(message: message);
      } else {
        debugPrint('Type Error Response : ${e.type}');
      }
      throw Exception(e.toString());
    }
  }
}