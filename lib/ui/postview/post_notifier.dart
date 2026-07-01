import 'package:flutter/material.dart';
import 'package:flutter_widget_cookbook/models/post_model.dart';
import 'package:flutter_widget_cookbook/repository/post_repository.dart';

class PostNotifier extends ChangeNotifier {
  final PostRepository _repository;
  PostNotifier(this._repository);

  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> loadPosts() async {
    _isLoading = true;
    _errorMessage = '';
    try {
      _posts = await _repository.getPosts();
    } catch(e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

// 1. create a state class and handle data change thru that state class
