import 'package:expenselog/presentation/widgets/my_drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:expenselog/core/extension/build_context_extension.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Image(
              height: 80,
              width: 80,

              image: AssetImage('assets/checklist.png'),
              color: context.colorScheme.inversePrimary,
              fit: BoxFit.contain,
            ),

          ),
          Text('Expense Log',style: TextStyle(color: context.colorScheme.inversePrimary,fontSize: 20,fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.all(25),
            child: Divider(color: context.colorScheme.secondary),
          ),
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
