import 'package:expenselog/core/routes/app_route.dart';
import 'package:expenselog/presentation/pages/home_page.dart';
import 'package:expenselog/presentation/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/themes/theme_provider.dart';
import 'core/themes/light_mode.dart';
import 'core/themes/dark_mode.dart';

void main() {
  runApp(ProviderScope(child: const MyApp())); //wrapping app in provider scope
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Expense Log',

      theme: lightMode,
      darkTheme: darkMode,

      //which theme to use based on current theme
      themeMode: currentTheme == darkMode ? ThemeMode.dark : ThemeMode.light,
      routerConfig: appRouter,
    );
  }
}
