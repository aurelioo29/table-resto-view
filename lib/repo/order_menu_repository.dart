import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pos_resto/core/api_client.dart';
import 'package:flutter_pos_resto/core/session_manager.dart';
import 'package:flutter_pos_resto/params/order_menu_param.dart';
import 'package:flutter_pos_resto/response/oder_menu_create_response.dart';

class OrderMenuRepository extends ApiClient {
  final sessionManager = SessionManager();
  Future<OderMenuCreateResponse> addOrderMenu(OrderMenuParam param) async {
    try {
      Options _options = Options(headers: {
        'Authorization': 'Token ${sessionManager.getActivateToken()}'
      });
      var response =
          await dio.post('order-menu-create', data: param, options: _options);
      debugPrint('AddOrderMenu response : ${response.data}');
      return OderMenuCreateResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
