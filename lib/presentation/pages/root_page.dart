



import 'package:expenselog/presentation/pages/home_page.dart';
import 'package:expenselog/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/bottom_nav_provider.dart';
import '../widgets/custom_nav_bar.dart';

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavIndexProvider);

    final pages = const [
      HomePage(),
      SettingsPage()
    ];

    return Scaffold(
      body: IndexedStack(
        index: index,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}