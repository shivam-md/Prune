import 'package:flutter/material.dart';
import 'package:project_manager/screens/menu_drawer.dart';

class FloatingAppBar extends StatelessWidget {
  const FloatingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(3),
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(10),
        //shape: ,
      ),
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () { MenuDrawer();},
              icon: const Icon(Icons.menu),
          ),
          const Text('Prune', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.settings),
          )


        ]
      ),
    );
  }
}
