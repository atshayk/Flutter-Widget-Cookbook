import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../login/login_screen.dart';
import '../home/home_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  // Reusable helper method to clear history and slide smoothly back to the left
  void _performLogoutSlideLeft(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
      (route) => false, // Clears the history stack completely
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(homeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('🧩 Widget Cookbook'),
        backgroundColor: Colors.blue.shade100,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _performLogoutSlideLeft(context), // Triggers clean helper animation
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return Card(
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade50,
                child: Icon(item['icon'], color: Colors.blue),
              ),
              title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item['desc']),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item['screen']),
              ),
            ),
          );
        },
      ),
    );
  }
}
