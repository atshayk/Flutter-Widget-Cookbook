import 'package:flutter/material.dart';

class MaterialComponentsScreen extends StatelessWidget {
  const MaterialComponentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material Components')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('This is a SnackBar message!')),
          );
        },
        child: const Icon(Icons.add_alert),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, '1. Interactive Prompts'),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('AlertDialog'),
                  content: const Text('This is a basic alert alert dialog popup.'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))
                  ],
                ),
              );
            },
            child: const Text('Trigger Alert Dialog'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  height: 150,
                  padding: const EdgeInsets.all(16.0),
                  child: const Center(child: Text('This is a Modal Bottom Sheet!')),
                ),
              );
            },
            child: const Text('Trigger Bottom Sheet'),
          ),
          const SizedBox(height: 20),

          _buildSectionTitle(context, '2. Information Triggers'),
          const MaterialBanner(
            content: Text('This is an inline Material Banner component.'),
            actions: [TextButton(onPressed: null, child: Text('DISMISS'))],
          ),
          const SizedBox(height: 20),
          const Center(
            child: Tooltip(
              message: 'Long press activation tooltip text',
              child: Text('Hold Long Press Me for Tooltip', style: TextStyle(decoration: TextDecoration.underline)),
            ),
          ),
          const SizedBox(height: 20),

          _buildSectionTitle(context, '3. List Layout Elements'),
          const ListTile(
            leading: Icon(Icons.star),
            title: Text('ListTile Title'),
            subtitle: Text('Supporting helper subtitle string context.'),
            trailing: Icon(Icons.more_vert),
          ),
          const ExpansionTile(
            title: Text('ExpansionTile (Dropdown Accordion)'),
            children: [
              ListTile(title: Text('Hidden Sub-item 1')),
              ListTile(title: Text('Hidden Sub-item 2')),
            ],
          ),
        ],
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
