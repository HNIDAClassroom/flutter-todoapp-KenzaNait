import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  final TextEditingController _titleController = TextEditingController();
  
  void _submitTaskData() {
    final enteredTitle = _titleController.text.trim();
    
    if (enteredTitle.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text(
              'Merci de saisir le titre de la tâche à ajouter dans la liste'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    
    // Mettez ici la logique pour enregistrer la nouvelle tâche avec le titre (enteredTitle)
    print(enteredTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          ElevatedButton(
            onPressed: _submitTaskData,
            child: Text('Save Task'),
          ),
        ],
      ),
    );
  }
}
