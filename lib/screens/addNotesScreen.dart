//In this file we are going to set and update data into firebase realtime database.
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_manager/database/write_firebase_rtdb.dart';
import 'package:project_manager/providers/task_model.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({Key? key}) : super(key: key);

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  final database = FirebaseDatabase.instance.ref();
  var selectedValue = 'Normal Priority';


  @override
  Widget build(BuildContext context) {
    priorityController.text = selectedValue;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Container(
                    alignment: Alignment.centerLeft,
                    //padding: EdgeInsets.only(right: 200),
                    height: 80,
                    width: 50,
                    child: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.delete_forever,color: Colors.red,),
                        iconSize: 32,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: DropdownButton(
                        items: menuItem,
                        value: selectedValue,
                        onChanged: (String? newValue){
                          setState(() {
                            selectedValue = newValue!;
                            priorityController.text = selectedValue;
                          });
                        }
                      ),
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 25,),

                  TextField(
                    textAlign: TextAlign.start,
                    controller: descriptionController,
                    minLines: 23,
                    maxLines: 200,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                      labelText: 'Description',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 25,),
                  ElevatedButton(
                      onPressed: (){
                        WriteDatabase.push(
                            path: TaskModel.DATABASE_PATH,
                            title: titleController.text,
                            description: descriptionController.text,
                            priority: priorityController.text
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(350, 50),
                        elevation: 2,
                      ),
                      child: const Text('Submit',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),)
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
  List<DropdownMenuItem<String>> get menuItem {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
        value: 'Normal Priority',
        child: Text('Normal Priority'),),
      DropdownMenuItem(
        value: 'High Priority',
        child: Text('High Priority'),),
      DropdownMenuItem(
        value: 'Max Priority',
        child: Text('Max Priority'),),

    ];
    return menuItems;
  }
}

