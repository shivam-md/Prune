
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_manager/database/write_firebase_rtdb.dart';
import 'package:project_manager/providers/task_model.dart';
import 'package:project_manager/screens/home_screen.dart';
import 'package:project_manager/screens/menu_drawer.dart';
import 'package:project_manager/screens/read_firebase_db.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await WriteDatabase.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskModel(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
