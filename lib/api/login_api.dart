import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

import '../models/user_model.dart';
import 'main_api.dart';

class LoginApi {
  final box = Hive.box('users');

  Future<ResponseResult> login({String? email, String? password}) async {
    try {
      final url = Uri.parse('${MainApi.baseUrl}user-service/auth/login');
      final Map<String, dynamic> data = {'email': email, 'password': password};
      final body = json.encode(data);

      Response result = await post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      Map<String, dynamic> responseBody = jsonDecode(result.body);
      box.put("accessToken", responseBody['accessToken']);

      return ResponseResult(data: User.fromJson(jsonDecode(result.body)));
    } catch (error) {
      return ResponseResult(errorMessage: error.toString());
    }
  }

  Future<String?> isAuthorized() async {
    return box.get('accessToken');
  }
}

class ResponseResult {
  ResponseResult({
    this.errorMessage,
    this.data,
  });

  final String? errorMessage;
  final User? data;
}
