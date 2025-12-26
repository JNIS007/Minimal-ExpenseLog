import 'package:flutter_test/flutter_test.dart';
import 'package:expenselog/main.dart';

void main() {
  testWidgets('App launches and shows empty state', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify that the app title is displayed
    expect(find.text('Expense Log'), findsOneWidget);

    // Verify empty state message is shown when no expenses exist
    expect(find.text('No expenses yet'), findsOneWidget);
    expect(find.text('Tap + to add your first expense'), findsOneWidget);

    // Verify the FAB (Floating Action Button) is present
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Navigation drawer opens', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Open the drawer
    final ScaffoldState state = tester.firstState(find.byType(Scaffold));
    state.openDrawer();
    await tester.pumpAndSettle();

    // Verify drawer is open by checking for settings option
    expect(find.text('Settings'), findsOneWidget);
  });
}
