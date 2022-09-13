// import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:yoko/models/activities.dart';

import 'main_api.dart';

class ActivitiesApi {
  final box = Hive.box('users');

  Future<ResponseResult> fetchActivities() async {
    final token = await box.get('accessToken');
    final url = Uri.parse(
        '${MainApi.baseUrl}ticket-service/ticket-types/by-category-code/ACTIVITIES');

    Response result = await get(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    final data = (jsonDecode(result.body) as List)
        .map((element) => Activities.fromJson(element))
        .toList();

    if (result.statusCode == 200) {
      return ResponseResult(data: data);
    } else {
      return ResponseResult(errorMessage: 'something went wrong');
    }
  }
}

class ResponseResult {
  ResponseResult({
    this.errorMessage,
    this.data,
  });

  final String? errorMessage;
  final List<Activities>? data;
}
