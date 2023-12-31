import 'package:flutter/material.dart';
import 'package:todolist_app/Widgets/auth_verify.dart';
import 'package:todolist_app/tasks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todolist_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(
 MaterialApp(
    theme: ThemeData(
      appBarTheme: const AppBarTheme(elevation: 0),
    useMaterial3: true,
     colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(background: Colors.red.shade50),
     scaffoldBackgroundColor: Color.fromARGB(255, 140, 161, 166),
  ),
      home: const AuthVerify(),
    ),
  );
}

