
import 'package:expenselog/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';




class MyDrawerTile extends StatelessWidget {
  final String text;
final IconData? icon;
final void Function()?onTap;

   MyDrawerTile({
     super.key,
     required this.text,
     required this.icon,
     required this.onTap
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25),
child: ListTile(
  onTap: onTap,
  title: Text(text,style: TextStyle(color: context.colorScheme.inversePrimary),),
leading: Icon(icon, color: context.colorScheme.inversePrimary,),
),
    );
  }
}
