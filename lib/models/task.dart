// this class receives json object from firebase RTDB and returns map value i.e, it's a formatting model class.

class Task{
  final String? description; // stores data from the description field inside of RTDB child node.
  final String? priority; // stores data from the priority field inside of RTDB child node.

  Task({required this.description,required this.priority} );
  // splits the map data and stores the individually to make fetching data easier.
  factory Task.fromRTDB(Map<String,dynamic> map){
    //calls constructor and sets data.
    return Task(description: map['description'], priority: map['priority']);
  }
}