




import 'package:expenselog/presentation/pages/add_expense.dart';
import 'package:expenselog/presentation/pages/chart_page.dart';
import 'package:expenselog/presentation/pages/home_page.dart';
import 'package:expenselog/presentation/pages/record_page.dart';
import 'package:expenselog/presentation/pages/root_page.dart';
import 'package:expenselog/presentation/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',



    routes: [
      GoRoute(path: '/home', builder: (context, state) => HomePage()),
      GoRoute(path: '/settings', builder: (context, state) => SettingsPage()),
      GoRoute(path: '/addExpense', builder: (context, state) => AddExpense()),
      GoRoute(path: '/chart', builder: (context, state) => ChartPage()),
      GoRoute(path: '/rootPage', builder: (context, state) => RootPage()),
          GoRoute(path: '/record', builder: (context, state) => RecordPage()),


    ]);