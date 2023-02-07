import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({Key? key}) : super(key: key);

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
    return Drawer(
      child: SingleChildScrollView(
        child: Expanded(
          // child: Column(
          //   children: [
          //     const SizedBox(
          //       height: 200,
          //     ),
              child:ListView.builder(
                shrinkWrap: true,
                  itemCount: _menuItem.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: [
                              const Icon(Icons.label_important_rounded),
                              const SizedBox(width: 15,),
                              Text(_menuItem[index],style: const TextStyle(fontSize: 16),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          const Divider(),
                          const SizedBox(height: 10,),
                        ],
                      ),
                    );
                  }),
           // ],
          ),
        ),
      //),
    );
  }
}
