import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/task.dart';

class FirestoreService {
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask(Task task) {
    return FirebaseFirestore.instance.collection("tasks").add({
      'taskTitle': task.title.toString(),
      'taskDesc': task.description.toString(),
      'taskCategory': task.category.toString(),
      'taskDate': task.date.toString(),
      'isCompleted': false,
      
      
    });
  }

  Stream<QuerySnapshot> getTasks() {
    final taskStream = tasks.snapshots();
    return taskStream;
  }

Future<void> deleteTask(String taskTitle) async {
    QuerySnapshot querySnapshot = await tasks.where('taskTitle', isEqualTo: taskTitle).get();
    querySnapshot.docs.forEach((doc) {
      doc.reference.delete();
    });
  }

//   Future<void> updateTaskByTitle(String taskTitle, bool isCompleted) async {
//   QuerySnapshot querySnapshot = await tasks.where('taskTitle', isEqualTo: taskTitle).get();
//   querySnapshot.docs.forEach((doc) {
//     doc.reference.update({'isCompleted': isCompleted});
//   });
// }
Future<void> updateTaskByTitle(String taskTitle, bool isCompleted) async {
  QuerySnapshot querySnapshot = await tasks.where('taskTitle', isEqualTo: taskTitle).get();
  querySnapshot.docs.forEach((doc) {
    final bool updatedIsCompleted = !isCompleted; // Inversion de la valeur actuelle
    doc.reference.update({'isCompleted': updatedIsCompleted});
  });
}



}