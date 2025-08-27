import 'dart:io';

import 'package:expenselog/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  const NavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: Platform.isAndroid ? 16 : 8,
      ),
      child: BottomAppBar(
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 60,
            color: context.colorScheme.primary,
            child: Row(
              children: [
                navItem(Icons.pie_chart, pageIndex == 0, onTap: onTap(0)),
                navItem(Icons.receipt_rounded, pageIndex == 1, onTap: onTap(1)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Icon(icon, color: selected ? Colors.grey[600] : Colors.grey[300]),
    ),
  );
}
