import 'package:flutter/material.dart';

class QuranInterpretationScreen extends StatefulWidget {
  const QuranInterpretationScreen({super.key});

  @override
  State<QuranInterpretationScreen> createState() =>
      _QuranInterpretationScreenState();
}

class _QuranInterpretationScreenState extends State<QuranInterpretationScreen> {
  final TextEditingController _surahController = TextEditingController();
  final TextEditingController _ayahController = TextEditingController();
  String _result = '';
  String _interpretationLevel = 'مختصر';

  void _getInterpretation() {
    // Placeholder for AI logic
    setState(() {
      _result =
          'هذا هو تفسير الآية (إجابة مؤقتة بمستوى $_interpretationLevel).';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفسير الآيات القرآنية'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _surahController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'أدخل اسم السورة',
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _ayahController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'أدخل رقم الآية',
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 16.0),
            SegmentedButton<String>(
              segments: const <ButtonSegment<String>>[
                ButtonSegment<String>(
                    value: 'مختصر', label: Text('مختصر')),
                ButtonSegment<String>(
                    value: 'متوسط', label: Text('متوسط')),
                ButtonSegment<String>(
                    value: 'عميق', label: Text('عميق')),
              ],
              selected: {_interpretationLevel},
              onSelectionChanged: (Set<String> newSelection) {
                setState(() {
                  _interpretationLevel = newSelection.first;
                });
              },
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
