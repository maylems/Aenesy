import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aenesy1/main.dart';

void main() {
  testWidgets('App boots to the onboarding screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: AenesyApp()));
    await tester.pump();

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
