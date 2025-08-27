import 'package:expenselog/core/extension/build_context_extension.dart';
import 'package:expenselog/presentation/widgets/custom_nav_bar.dart';
import 'package:expenselog/presentation/widgets/my_drawer.dart';
import 'package:expenselog/presentation/widgets/nav_bar.dart';
import 'package:expenselog/presentation/widgets/nav_bar_model.dart';
import 'package:expenselog/presentation/widgets/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Log'), centerTitle: true),
      drawer: MyDrawer(),
      body: Column(
        children: [

        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),


        onPressed: () => context.push('/addExpense'),
        child: Icon(Icons.add),

        backgroundColor: context.colorScheme.inversePrimary,
      ),
      bottomNavigationBar: CustomBottomNavBar(),


    );
  }
}
