import 'package:flutter/material.dart';

class ButtonInputWidgetsScreen extends StatefulWidget {
  const ButtonInputWidgetsScreen({super.key});

  @override
  State<ButtonInputWidgetsScreen> createState() => _ButtonInputWidgetsScreenState();
}

class _ButtonInputWidgetsScreenState extends State<ButtonInputWidgetsScreen> {
  bool _switchVal = false;
  bool _checkboxVal = false;
  int _radioVal = 0;
  double _sliderVal = 20.0;
  final List<bool> _toggleSelects = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons & Inputs')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('1. Standard Material Buttons'),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
                FilledButton(onPressed: () {}, child: const Text('Filled')),
                OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
                TextButton(onPressed: () {}, child: const Text('Text')),
              ],
            ),
            const SizedBox(height: 20),

            _buildSectionTitle('2. Icon & Toggle Buttons'),
            Row(
              children: [
                IconButton(icon: const Icon(Icons.volume_up), onPressed: () {}),
                const SizedBox(width: 20),
                ToggleButtons(
                  isSelected: _toggleSelects,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _toggleSelects.length; i++) {
                        _toggleSelects[i] = i == index;
                      }
                    });
                  },
                  children: const [Icon(Icons.format_align_left), Icon(Icons.format_align_center), Icon(Icons.format_align_right)],
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildSectionTitle('3. Text Input fields'),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Outlined TextField',
                hintText: 'Enter text here...',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Underlined TextField',
                suffixIcon: Icon(Icons.check),
              ),
            ),
            const SizedBox(height: 20),

            _buildSectionTitle('4. Selection Inputs'),
            CheckboxListTile(
              title: const Text('Checkbox Option'),
              value: _checkboxVal,
              onChanged: (val) => setState(() => _checkboxVal = val!),
            ),
            SwitchListTile(
              title: const Text('Switch Option'),
              value: _switchVal,
              onChanged: (val) => setState(() => _switchVal = val),
            ),
            Row(
              children: [
                Radio<int>(value: 0, groupValue: _radioVal, onChanged: (val) => setState(() => _radioVal = val!)),
                const Text('Radio 1'),
                Radio<int>(value: 1, groupValue: _radioVal, onChanged: (val) => setState(() => _radioVal = val!)),
                const Text('Radio 2'),
              ],
            ),
            const SizedBox(height: 20),

            _buildSectionTitle('5. Slider Input'),
            Slider(
              value: _sliderVal,
              max: 100,
              divisions: 5,
              label: _sliderVal.round().toString(),
              onChanged: (double value) => setState(() => _sliderVal = value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
