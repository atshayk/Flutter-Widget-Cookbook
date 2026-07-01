import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_cookbook/providers.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});
  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      ref.read(postViewModelProvider).loadPosts();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(postViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('API call to jsonplaceholder.typicode.com')),
      body: viewModel.isLoading
        ? const Center(child: CircularProgressIndicator())
        : viewModel.errorMessage.isNotEmpty
          ? Center(child: Text(viewModel.errorMessage))
          : ListView.builder(
              itemCount: viewModel.posts.length,
              itemBuilder: (contwxt, index) {
                final post = viewModel.posts[index];
                return ListTile(
                  title: Text(post.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(post.body)
                );
              },
          ),
    );
  }
}
