import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({Key? key}) : super(key: key);
  final List<String> _menuItem = ['Setting', 'User', 'Completed Tasks', 'Stats', 'Send FeedBack', 'About Us'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              itemCount: _menuItem.length,
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    title: Text(_menuItem[index]),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}
