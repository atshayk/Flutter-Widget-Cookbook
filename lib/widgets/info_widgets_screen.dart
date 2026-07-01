import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InfoDisplayWidgetsScreen extends StatelessWidget {
  const InfoDisplayWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Information Display')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '1. Cards & Dividers'),
            const Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('This text is inside an elevated Card widget.'),
              ),
            ),
            const Divider(height: 30, thickness: 2, color: Colors.grey),

            _buildSectionTitle(context, '2. Badges & Chips'),
            const Row(
              children: [
                Badge(label: Text('5'), child: Icon(Icons.notifications, size: 36)),
                SizedBox(width: 30),
                Chip(avatar: CircleAvatar(child: Text('AZ')), label: Text('Action Chip'))
              ],
            ),
            const SizedBox(height: 20),

            _buildSectionTitle(context, '3. Progress Indicators'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 150, child: LinearProgressIndicator()),
              ],
            ),
            const SizedBox(height: 20),

            _buildSectionTitle(context, '4. Images & Placeholders'),
            Row(
              children: [
                const SizedBox(width: 100, height: 100, child: Placeholder(fallbackHeight: 100, fallbackWidth: 100)),
                const SizedBox(width: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://picsum.photos',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.broken_image),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildSectionTitle(context, '5. Cupertino (iOS-Style) Indicators'),
            const Row(
              children: [
                CupertinoActivityIndicator(radius: 15),
                SizedBox(width: 10),
                Text('Cupertino Style Spinner')
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
