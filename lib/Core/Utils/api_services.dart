import 'package:dio/dio.dart';
import '../Managers/constant.dart';

class ApiServices {
  final Dio _dio;

  const ApiServices(this._dio);

  Future<Response> get(
      {required String endPoint,
      Map<String, dynamic>? queries,
      Map<String, dynamic>? headers}) async {
    var response = await _dio.get('${Constant.baseUrl}$endPoint',
        queryParameters: queries, options: Options(headers: headers));
    return response;
  }

  Future<Response>  post(
      {required String endPoint,
      Map<String, dynamic>? headers,
      FormData? data,
      onSendProgress}) async {
    var response = await _dio.post('${Constant.baseUrl}$endPoint',
        data: data,
        options: Options(headers: headers),
        onSendProgress: onSendProgress);
    return response;
  }

  Future<Response>  put(
      {required String endPoint,
        Map<String, dynamic>? headers,
      FormData? data,
      onSendProgress}) async {
    var response = await _dio.put('${Constant.baseUrl}$endPoint',
        data: data, options: Options(headers: headers), onSendProgress: onSendProgress);
    return response;
  }

  Future<Response>  delete(
      {required String endPoint,
      Map<String, dynamic>? queries,
      Map<String, dynamic>? headers}) async {
    var response = await _dio.delete('${Constant.baseUrl}$endPoint',
        queryParameters: queries, options: Options(headers: headers));
    return response;
  }
}
