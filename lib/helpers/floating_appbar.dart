import 'package:flutter/material.dart';

class FloatingAppBar extends StatelessWidget {
  FloatingAppBar({Key? key}) : super(key: key);

  final List<String> _menuItem = [
    'Setting',
    'User',
    'Completed Tasks',
    'Stats',
    'Send FeedBack',
    'About Us'
  ];

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
          InkWell(
            onTap: (){
              Drawer();
            },
            child: Icon(Icons.menu),
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
