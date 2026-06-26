import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patrimonia/app.dart';

void main() {
  testWidgets('Carga inicial smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: PatrimonIAApp(),
      ),
    );

    expect(find.text('PatrimonIA'), findsWidgets);
    expect(find.text('Bienvenido de vuelta'), findsOneWidget);
  });
}
