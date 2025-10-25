import 'package:flutter/material.dart';

class DreamInterpretationScreen extends StatefulWidget {
  const DreamInterpretationScreen({super.key});

  @override
  State<DreamInterpretationScreen> createState() =>
      _DreamInterpretationScreenState();
}

class _DreamInterpretationScreenState extends State<DreamInterpretationScreen> {
  final TextEditingController _textController = TextEditingController();
  String _result = '';

  void _getInterpretation() {
    // Placeholder for AI logic
    setState(() {
      _result = 'هذا هو تفسير حلمك (إجابة مؤقتة).';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفسير الأحلام'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'اكتب وصف حلمك هنا...',
              ),
              textAlign: TextAlign.right,
              maxLines: 10,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _getInterpretation,
              child: const Text('الحصول على التفسير'),
            ),
            const SizedBox(height: 32.0),
            if (_result.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _result,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
