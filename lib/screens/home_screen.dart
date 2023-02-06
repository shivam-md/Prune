import 'package:flutter/material.dart';
import 'package:project_manager/helpers/custom_button.dart';
import 'package:project_manager/providers/task_model.dart';
import 'package:project_manager/screens/write_firebase_db.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final listView = [];

  @override
  Widget build(BuildContext context) {
    print("HomeScreen Is  Visible");
    return SafeArea(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Consumer<TaskModel>(
              builder: (context, model, child) {
                return ListView(
                  children: [
                    ...model.taskData.map(
                      (task) => Card(
                        child: ListTile(
                          title: Text(
                            task.description!,
                            maxLines: 1,
                          ),
                          subtitle: Text(task.priority!),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              elevation: 2,
              hoverElevation: 4,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Column(
                            children: [
                            CustomButton(
                              callBack: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WriteDatabase(),
                                  ),
                                );
                              },
                              buttonTitle: 'Add Notes',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              callBack: () {
                                Navigator.pop(context);
                              },
                              buttonTitle: 'Add Task',
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: const Text(
                '+',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
