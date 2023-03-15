//Notifies about change in database and rebuilds the respective widgets based on updated data(state).

import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_manager/models/task.dart';

class TaskModel extends ChangeNotifier {
  // list of Task class objects.
  List<Task> _task = [];

  // firebase database reference RTDB.
  final _database = FirebaseDatabase.instance.ref();
  static const DATABASE_PATH = '/tasks';

  // When you listen on a Stream using Stream.listen, a StreamSubscription object is returned.
  late StreamSubscription _taskStream;

  // this will update everytime _task changes.
  List<Task> get taskData => _task;

  TaskModel(){
    //execute when class called
    _listenToTasks();
  }


  void _listenToTasks() {
    _taskStream = _database.child(DATABASE_PATH).onValue.listen((event) {

      //database(Map)<key,value>
      final taskMap = Map<String,dynamic>.from(event.snapshot.value as dynamic);

      // database(Map)<key,value(Map)>  ==> value(Map)<key,value>
      _task = taskMap.values.map((orderAsJson) =>
        // send orderAsJson data to our model class to make into usable format.
        Task.fromRTDB(Map<String, dynamic>.from(orderAsJson as dynamic))
      ).toList();

    });
    print('Task Stream $_taskStream');

    // informs children about changes.
    notifyListeners();
  }


}
