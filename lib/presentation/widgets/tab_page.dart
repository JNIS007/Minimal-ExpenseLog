import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  final int tab;
  TabPage({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$tab')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$tab"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Page(tab: tab)));
              },
              child: Text('Go to Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final int tab;
   Page({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab: $tab'),),
      body: Center(child: Text("Tab: $tab"),),
    );
  }
}
