import 'package:flutter/material.dart';
import 'package:project_manager/helpers/custom_button.dart';

import '../screens/addNotesScreen.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 2,
      hoverElevation: 4,
      child: const Text(
        '+',
        style: TextStyle(fontSize: 35),
      ),
      onPressed: () =>
          showDialog(context: context, builder: (_) =>
              AlertDialog(
                title: Column(
                  children: [
                    CustomButton(
                      callBack: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddNotesScreen(),
                          ),
                        );
                      },
                      buttonChild: const Text('Add Notes'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      callBack: () {
                        Navigator.pop(context);
                      },
                      buttonChild: const Text('Add Task'),
                    ),
                  ],
                ),),
          ),);
  }
}
