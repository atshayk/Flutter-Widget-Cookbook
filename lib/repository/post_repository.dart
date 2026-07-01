import 'package:my_app/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
}
