import 'package:dio/dio.dart';
import 'package:flutter_widget_cookbook/data/network/api_client.dart';
import 'package:flutter_widget_cookbook/models/post_model.dart';

class ApiService {
  final ApiClient _apiClient;

  ApiService(this._apiClient);

  Future<List<PostModel>> fetchPosts() async {
    try{
      final response = await _apiClient.dio.get('/posts');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch posts');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
