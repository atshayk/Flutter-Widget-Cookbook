import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_cookbook/data/network/api_client.dart';
import 'package:flutter_widget_cookbook/data/api/api_service.dart';
import 'package:flutter_widget_cookbook/repository/post_repository.dart';
import 'package:flutter_widget_cookbook/repository/post_repository_impl.dart';
import 'package:flutter_widget_cookbook/ui/postview/post_notifier.dart';

final apiClientProvider = Provider((ref) => ApiClient());

final apiServiceProvider = Provider((ref) {
  final client = ref.watch(apiClientProvider);
  return ApiService(client);
});

final postRepositoryProvider = Provider<PostRepository>((ref){
  final service = ref.watch(apiServiceProvider);
  return PostRepositoryImpl(service) as PostRepository;
});

final postViewModelProvider = ChangeNotifierProvider((ref){
  final repository = ref.watch(postRepositoryProvider);
  return PostNotifier(repository);
});
