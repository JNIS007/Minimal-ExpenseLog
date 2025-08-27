







import 'package:expenselog/core/extension/build_context_extension.dart';
import 'package:expenselog/presentation/pages/chart_page.dart';
import 'package:expenselog/presentation/pages/home_page.dart';
import 'package:expenselog/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../provider/bottom_nav_provider.dart';

class CustomBottomNavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);



    return BottomAppBar(

      shape: CircularNotchedRectangle(),

      color: context.colorScheme.secondary,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: currentIndex == 0 ? context.colorScheme.inversePrimary : context.colorScheme.primary
            ),
            onPressed: () {
              ref.read(bottomNavIndexProvider.notifier).state = 0;
            },
          ),
          // Space for the FAB
          IconButton(
            icon: Icon(
              Icons.pie_chart,
              color: currentIndex == 1 ? context.colorScheme.inversePrimary : context.colorScheme.primary
            ),
            onPressed: () {
              ref.read(bottomNavIndexProvider.notifier).state = 1;
              context.push('/chart');
            },
          ),
          IconButton(
            icon: Icon(
                Icons.receipt,
                color: currentIndex == 2 ? context.colorScheme.inversePrimary : context.colorScheme.primary
            ),
            onPressed: () {
              ref.read(bottomNavIndexProvider.notifier).state = 2;
              context.push('/record');
            },
          ),
          IconButton(
            icon: Icon(
                Icons.settings,
                color: currentIndex == 3 ? context.colorScheme.inversePrimary : context.colorScheme.primary
            ),
            onPressed: () {
              ref.read(bottomNavIndexProvider.notifier).state = 3;
              context.push('/settings');
            },
          ),
        ],
      ),
    );
  }
}