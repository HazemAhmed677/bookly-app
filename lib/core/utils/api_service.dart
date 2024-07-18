import 'package:dio/dio.dart';

class ApiService {
  final String _baseURL = 'https://www.googleapis.com/books/v1/volumes?';
  final Dio dio;
  ApiService({required this.dio});
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await Dio().get('$_baseURL$endpoint');
    return response.data;
  }
}
