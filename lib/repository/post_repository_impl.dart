import 'package:flutter_widget_cookbook/data/api/api_service.dart';
import 'package:flutter_widget_cookbook/models/post_model.dart';
import 'package:flutter_widget_cookbook/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final ApiService _apiService;
  PostRepositoryImpl(this._apiService);

  @override
  Future<List<PostModel>> getPosts() async {
    return await _apiService.fetchPosts();
  }
}
