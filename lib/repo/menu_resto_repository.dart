import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos_resto/core/api_client.dart';
import 'package:flutter_pos_resto/models/menu_resto_model.dart';

class MenuRestoRepository extends ApiClient {
  Future<List<MenuRestoModel>> getMenuRestoPagination(
      int _limit, int _offset) async {
    try {
      final response =
          await dio.get('menu-resto-filter/?limit=${_limit}&offset=${_offset}');
      debugPrint('Menu Resto Response : ${response.data['results']}');
      List list = response.data['results'];
      List<MenuRestoModel> listMenuRestoModel =
          list.map((element) => MenuRestoModel.fromJson(element)).toList();
      return listMenuRestoModel;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
