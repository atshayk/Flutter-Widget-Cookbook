import 'package:flutter/material.dart';

class LayoutWidgetsScreen extends StatelessWidget {
  const LayoutWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layout & Basic Widgets')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '1. Container with Styling'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue, width: 2),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2))],
              ),
              child: const Text('I am a styled Container Widget'),
            ),
            const SizedBox(height: 20),

            _buildSectionTitle(context, '2. Row & Expanded'),
            Row(
              children: [
                Expanded(
                  child: 
                  Container(
                    color: Colors.red, height: 50, 
                    child: const Center(child: Text('Expanded 1', 
                    style: TextStyle(color: Colors.white)
                    )))
                ),
                const SizedBox(width: 8),
                Container(color: Colors.green, height: 50, width: 80, child: const Center(child: Text('Fixed Width', style: TextStyle(color: Colors.white, fontSize: 11)))),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    color: Colors.blue, 
                    height: 50, child: const Center(child: Text('Expanded 2', 
                    style: TextStyle(color: Colors.white))))
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildSectionTitle(context, '3. Stack & Positioned'),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(color: Colors.amber, width: double.infinity, height: 150),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(color: Colors.red, width: 60, height: 60, child: const Center(child: Text('Top Left', style: TextStyle(color: Colors.white, fontSize: 10)))),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(color: Colors.purple, width: 80, height: 40, child: const Center(child: Text('Bottom Right', style: TextStyle(color: Colors.white, fontSize: 10)))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            _buildSectionTitle(context, '4. Wrap Widget (Flowing Layout)'),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: List.generate(5, (index) => Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('$index', style: const TextStyle(fontSize: 10, color: Colors.white))),
                label: Text('Tag ${index + 1}'),
              )),
            ),
            const SizedBox(height: 20),

            _buildSectionTitle(context, '5. Table Widget'),
            Table(
              border: TableBorder.all(color: Colors.grey),
              children: const [
                TableRow(children: [
                  Padding(padding: EdgeInsets.all(8.0), child: Text('Header 1', style: TextStyle(fontWeight: FontWeight.bold))),
                  Padding(padding: EdgeInsets.all(8.0), child: Text('Header 2', style: TextStyle(fontWeight: FontWeight.bold))),
                ]),
                TableRow(children: [
                  Padding(padding: EdgeInsets.all(8.0), child: Text('Cell A')),
                  Padding(padding: EdgeInsets.all(8.0), child: Text('Cell B')),
                ]),
              ],
            ),
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
