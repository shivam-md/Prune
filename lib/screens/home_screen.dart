

import 'package:flutter/material.dart';
import 'package:project_manager/helpers/custom_action_button.dart';
import 'package:project_manager/helpers/floating_appbar.dart';
import 'package:project_manager/providers/task_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final listView = [];

  @override
  Widget build(BuildContext context) {
    //print("HomeScreen Is  Visible");
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 70,right: 20, left: 20, bottom: 20),
                // receives data from changeListener inside ChangeNotifier Provider.
                child: Consumer<TaskModel>(
                  builder: (context, model, child) {
                    return ListView(
                      children: [
                        ...model.taskData.map(
                          (task) => Card(
                            child: ListTile(
                              title: Text(
                                task.title!,
                                maxLines: 1,
                              ),
                              subtitle: Text(task.description!),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // action button presents alert dialog box
              const Positioned(
                bottom: 20,
                right: 20,
                child: CustomActionButton(),
              ),
              // Floating custom app bar
              Positioned(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      child: FloatingAppBar(),

                  ),
              ),
            ],
          ),
        ),
    );
  }
}
