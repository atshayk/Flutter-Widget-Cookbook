import 'package:my_app/data/api/api_service.dart';
import 'package:my_app/models/post_model.dart';
import 'package:my_app/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final ApiService _apiService;
  PostRepositoryImpl(this._apiService);

  @override
  Future<List<PostModel>> getPosts() async {
    return await _apiService.fetchPosts();
  }
}
