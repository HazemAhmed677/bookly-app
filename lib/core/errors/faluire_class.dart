import 'package:dio/dio.dart';

class ServerFaluire {
  final String errorMsg;

  ServerFaluire(this.errorMsg);

  factory ServerFaluire.FromDioException(
      {required DioExceptionType dioExecption,
      dynamic response,
      int? statusCode}) {
    switch (dioExecption) {
      case DioExceptionType.connectionTimeout:
        return ServerFaluire('Connection timeout, Please try again');
      case DioExceptionType.sendTimeout:
        return ServerFaluire('Send timeout, Check your network');
      case DioExceptionType.receiveTimeout:
        return ServerFaluire('Receive timeout, Check your network');
      case DioExceptionType.badCertificate:
        return ServerFaluire('Bad certificate, Please try later');
      case DioExceptionType.badResponse:
        return ServerFaluire.fromBadResponse(
            statusCode: statusCode, response: response);
      case DioExceptionType.cancel:
        return ServerFaluire('Request to server was canceled');
      case DioExceptionType.connectionError:
        return ServerFaluire('No Internet connection');
      case DioExceptionType.unknown:
        return ServerFaluire('Oops, there something wrong!');
      default:
        return ServerFaluire('Oops, there something wrong!');
    }
  }
  factory ServerFaluire.fromBadResponse({int? statusCode, dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaluire(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFaluire('Your request not found');
    } else {
      return ServerFaluire('Oops, there somthing wrong!');
    }
  }
}
