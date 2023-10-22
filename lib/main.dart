import 'package:flutter/material.dart';
import 'package:todolist_app/tasks.dart';

void main() {
  runApp(
 MaterialApp(
    theme: ThemeData(
      appBarTheme: const AppBarTheme(elevation: 0),
    useMaterial3: true,
     colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(background: Colors.red.shade50),
     scaffoldBackgroundColor: const Color.fromARGB(255, 143, 143, 193),
  ),
      home: const Tasks(),
    ),
  );
}

