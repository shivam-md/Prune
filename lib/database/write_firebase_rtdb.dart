
import 'package:firebase_database/firebase_database.dart';

class WriteDatabase{

  static DatabaseReference? _database;

  static init(){
    _database = FirebaseDatabase.instance.ref();
  }

  static Future push({required String path,required String title, required String description, required String priority, })async{
    await _database!.child(path).push().set({
      'title': title,
      'description': description,
      'priority': priority,
    }
    ).catchError((onError) => print('Error in pushing data on firebase database: $onError'));
  }
}