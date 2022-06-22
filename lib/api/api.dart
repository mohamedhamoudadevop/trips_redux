import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:redux_state/models/trips_model.dart';

class Api {
  Dio dio;

  Api(this.dio) {
    assert(dio.options.baseUrl.isNotEmpty);
  }

  Future<List<TopDestination>> getPosts() async {
    try {
      final response = await dio.get("/Home/HomeDetails");
      return (response.data['data']['topDestination'] as List<dynamic>)
          .map((json) => TopDestination.fromJson(json))
          .toList();
    } catch (e, s) {
      debugPrint("$e\n$s");
      throw ApiException("An api error occurred");
    }
  }
}

class ApiException {
  final String message;

  ApiException(this.message);
}
