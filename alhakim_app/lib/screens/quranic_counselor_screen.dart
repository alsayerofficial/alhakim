import 'package:alhakim_app/services/llm_service.dart';
import 'package:flutter/material.dart';

class QuranicCounselorScreen extends StatefulWidget {
  const QuranicCounselorScreen({super.key});

  @override
  State<QuranicCounselorScreen> createState() => _QuranicCounselorScreenState();
}

class _QuranicCounselorScreenState extends State<QuranicCounselorScreen> {
  final TextEditingController _textController = TextEditingController();
  String _result = '';
  bool _isLoading = false;

  Future<void> _getAdvice() async {
    if (_textController.text.isEmpty) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // TODO: Replace with user-provided API key and URL from settings
    final llmService = LlmService(
      apiKey: 'YOUR_API_KEY',
      apiUrl: 'https://api.openai.com/v1/completions', // Example URL
    );

    final prompt =
        'Provide a relevant Quranic verse for the following feeling or problem: ${_textController.text}';
    final response = await llmService.getResponse(prompt);

    setState(() {
      _result = response;
      _isLoading = false;
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
              onPressed: _isLoading ? null : _getAdvice,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('تدبّر'),
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
