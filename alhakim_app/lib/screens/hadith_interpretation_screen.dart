import 'package:flutter/material.dart';

class HadithInterpretationScreen extends StatefulWidget {
  const HadithInterpretationScreen({super.key});

  @override
  State<HadithInterpretationScreen> createState() =>
      _HadithInterpretationScreenState();
}

class _HadithInterpretationScreenState
    extends State<HadithInterpretationScreen> {
  final TextEditingController _textController = TextEditingController();
  String _result = '';

  void _getInterpretation() {
    // Placeholder for AI logic
    setState(() {
      _result = 'هذا هو تفسير الحديث (إجابة مؤقتة).';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفسير الأحاديث النبوية'),
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
                labelText: 'اكتب الحديث النبوي هنا...',
              ),
              textAlign: TextAlign.right,
              maxLines: 5,
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
