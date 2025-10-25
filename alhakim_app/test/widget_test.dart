import 'package:alhakim_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alhakim_app/main.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('App title is displayed', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const AlhakimApp(),
      ),
    );

    // Verify that the app title is displayed.
    expect(find.text('المستشار القرآني الذكي'), findsOneWidget);
  });
}
