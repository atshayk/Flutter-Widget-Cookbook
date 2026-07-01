import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/data/network/api_client.dart';
import 'package:my_app/data/api/api_service.dart';
import 'package:my_app/repository/post_repository.dart';
import 'package:my_app/repository/post_repository_impl.dart';
import 'package:my_app/ui/postview/post_notifier.dart';

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
