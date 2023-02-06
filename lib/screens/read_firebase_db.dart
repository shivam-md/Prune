import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_manager/screens/write_firebase_db.dart';

class ReadDatabase extends StatefulWidget {
  const ReadDatabase({Key? key}) : super(key: key);

  @override
  State<ReadDatabase> createState() => _ReadDatabaseState();
}

class _ReadDatabaseState extends State<ReadDatabase> {

  final _database = FirebaseDatabase.instance.ref();
  String descriptionText = 'Original Text';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _activeListeners();
  }
  void _activeListeners(){
    const databasePath = 'task/title: test1/description';
    _database.child(databasePath).onValue.listen((event) {
      final String description = event.snapshot.value.toString();
      setState(() {
        descriptionText = description;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Text(descriptionText),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WriteDatabase() ));
                      },
                      child: const Text('Add Task',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
