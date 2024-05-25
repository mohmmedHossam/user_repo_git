import 'package:dio/dio.dart';
import 'package:user_repo_git/Core/Managers/constant.dart';

abstract class Failure {
  final String errorMessage;
  int statusCode;

  Failure({required this.errorMessage , this.statusCode = 400});
}

class ServerError extends Failure {
  ServerError({required super.errorMessage , super.statusCode});

  factory ServerError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(errorMessage: 'Connection to Server Timeout');
      case DioExceptionType.sendTimeout:
        return ServerError(errorMessage: 'Send to Server Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerError(errorMessage: 'Receiver with Server Timeout');
      case DioExceptionType.badCertificate:
        return ServerError(errorMessage: 'Bad Certificate For Server');
      case DioExceptionType.badResponse:
        printDB("DioError printDB ${dioError.response}");
        return ServerError.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerError(errorMessage: 'Connection to Server Canceled');
      case DioExceptionType.connectionError:
        return ServerError(
            errorMessage: 'No Internet Connection , check Your connection');
      case DioExceptionType.unknown:
        return ServerError(errorMessage: 'Opps UnExpected Error');
      default:
        return ServerError(errorMessage: 'Opps UnExpected Error');
    }
  }

  factory ServerError.fromResponse(int status, dynamic response) {
    if (response.containsKey('message')) {
      if (status == 400 ||
          status == 401 ||
          status == 422 ||
          status == 403 ||
          status == 404 ||
          status == 500) {
        return ServerError(errorMessage: response['message'].toString() ,statusCode: status );
      } else {
        return ServerError(
            errorMessage: 'Opps UnExpected Error , Please Try again');
      }
    }
    return ServerError(
        errorMessage: 'Opps UnExpected Error , Please Try again');
  }
}
