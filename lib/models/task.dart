import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { personal, work, shopping, others }

class Task{

    Task({

        required this.title,

        required this.description,

        required this.date,

         this.isCompleted = false,

        required this.category,

    }) : id = uuid.v4();

        final String id;

        final String title;

        final String description;

        final DateTime date;

         bool isCompleted;

        final Category category;

}