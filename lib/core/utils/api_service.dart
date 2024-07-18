import 'package:dio/dio.dart';

class Api {
  Future<Response> get({required String endpoint}) async {
    var response = await Dio().get(endpoint);
    return response;
  }
}
