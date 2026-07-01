import 'package:flutter/material.dart';
import '../app_theme.dart';

class AsyncWidgetsScreen extends StatelessWidget {
  const AsyncWidgetsScreen({super.key});

  Future<String> _fetchNetworkData() async {
    await Future.delayed(const Duration(seconds: 3));
    return "✅ Server Payload Loaded Successfully!";
  }

  Stream<int> _liveCounterStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Async & Await Cookbook')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('1. Future<> Builder (one-time network API load)', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryBlue)),
            const SizedBox(height: 10),
            FutureBuilder<String>(
              future: _fetchNetworkData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Card(child: ListTile(leading: CircularProgressIndicator(), title: Text('Fetching data...')));
                } else if (snapshot.hasError) {
                  return const Text('An error occurred.');
                } else {
                  return Card(color: Colors.green.shade50, child: ListTile(iconColor: Colors.green, leading: const Icon(Icons.check_circle), title: Text(snapshot.data ?? '')));
                }
              },
            ),
            const SizedBox(height: 40),
            const Text('2. Stream<> Builder (continuous live ticker pipeline)', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryBlue)),
            const SizedBox(height: 10),
            StreamBuilder<int>(
              stream: _liveCounterStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Stream initializing...');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return const Text('🏁 Live data stream transmission finished.');
                } else {
                  return Card(
                    color: Colors.amber.shade50,
                    child: ListTile(
                      leading: const Icon(Icons.sensors, color: Colors.amber),
                      title: Text('Live Event Ticker Value: ${snapshot.data}'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
