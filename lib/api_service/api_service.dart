import 'package:dio/dio.dart';

class NetworkApiService {
  final dio = Dio();
  Future<Response> getApiResponse(String getUrl) async {
    try {
      final response = await dio.get(getUrl);
      return response;
    } catch (e) {
      throw Exception('Failed to load API response: $e');
    }
  }
}
