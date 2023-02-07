import 'package:flutter/material.dart';
import 'package:project_manager/screens/menu_drawer.dart';

class FloatingAppBar extends StatelessWidget {
  const FloatingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MenuDrawer(),

        ]
      ),
    );
  }
}
