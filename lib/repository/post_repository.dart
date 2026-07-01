import 'package:flutter_widget_cookbook/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
}
