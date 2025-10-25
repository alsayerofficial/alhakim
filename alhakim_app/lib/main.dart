import 'package:flutter/material.dart';

void main() {
  runApp(const AlhakimApp());
}

class AlhakimApp extends StatelessWidget {
  const AlhakimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alhakim App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const QuranicCounselorScreen(),
    );
  }
}

class QuranicCounselorScreen extends StatefulWidget {
  const QuranicCounselorScreen({super.key});

  @override
  State<QuranicCounselorScreen> createState() => _QuranicCounselorScreenState();
}

class _QuranicCounselorScreenState extends State<QuranicCounselorScreen> {
  final TextEditingController _textController = TextEditingController();
  String _result = '';

  void _getAdvice() {
    // Placeholder for AI logic
    setState(() {
      _result = '﴿لَا تَحْزَنْ إِنَّ اللَّهَ مَعَنَا﴾ [التوبة: 40]';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المستشار القرآني الذكي'),
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
                labelText: 'اكتب مشكلتك أو شعورك...',
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _getAdvice,
              child: const Text('تدبّر'),
            ),
            const SizedBox(height: 32.0),
            if (_result.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _result,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
