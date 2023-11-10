import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';
import 'package:todolist_app/services/firestore.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  TaskItem(this.task);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          children: [
            Row(
              children: [
                
                Checkbox(
                  value: widget.task.isCompleted,
                  onChanged: (bool? newValue) {
                    if (newValue != null) {
                      firestoreService.updateTaskByTitle(widget.task.title, newValue);
                      setState(() {
                        widget.task.isCompleted = newValue;
                      });
                    }
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.task.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(widget.task.description),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date: ${widget.task.date}', textAlign: TextAlign.left),
                      const SizedBox(height: 5),
                      Text('Category: ${widget.task.category.name}', textAlign: TextAlign.left),
                    ],
                  ),
                ),
                Spacer(),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Confirmez la suppression"),
                          content: Text("Êtes-vous sûr de vouloir supprimer cette tâche ?"),
                          actions: <Widget>[
                            TextButton(
                              child: Text("Oui"),
                              onPressed: () {
                                // Supprimez la tâche ici
                                firestoreService.deleteTask(widget.task.title);
                                Navigator.of(context).pop(); // Ferme la boîte de dialogue
                              },
                            ),
                            TextButton(
                              child: Text("Non"),
                              onPressed: () {
                                Navigator.of(context).pop(); // Ferme la boîte de dialogue
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ],
          
        ),
      ),
    );
  }
}
