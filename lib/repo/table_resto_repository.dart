//Jangan pasang token di apiclient
// pasang token di repository
// 1 model 1 repository

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos_resto/core/api_client.dart';
import 'package:flutter_pos_resto/response/table_resto_response.dart';

class TableRestoRepository extends ApiClient{

  Future<TableRestoResponse> getAllTableResto() async{
    // template untuk try
    // try {} on DioException catch(e){
    //   throw Exception(e.toString());
    try {
      var response = await dio.get('table_resto');
      debugPrint('TableResto Response : ${response.data}');
      return TableRestoResponse.fromJson(response.data);
    } on DioException catch(e){
      throw Exception(e.toString());
    }
  }
}