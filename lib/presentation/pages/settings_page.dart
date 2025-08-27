import 'package:expenselog/core/extension/build_context_extension.dart';
import 'package:expenselog/core/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expenselog/core/themes/dark_mode.dart';




class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final isDarkMode = currentTheme == darkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: context.colorScheme.surface,
      ),
      body: Column(
        children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
color: context.colorScheme.secondary
              ),
margin: EdgeInsets.only(left: 25, right: 25, top: 10),
padding: EdgeInsets.all(25),
              child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dark Mode',
                  style: TextStyle(
                    color: context.colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  CupertinoSwitch(
                      value: isDarkMode, onChanged: (_){
                        ref.read(themeProvider.notifier).toggleTheme();
                  }
                  )
                ],
              ),

            )
        ],

      ),

    );
  }
}
