import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'package:flutter/material.dart';

import 'package:todolist_app/tasks.dart';

// import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

class AuthVerify extends StatelessWidget {
  const AuthVerify({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return StreamBuilder<User?>(
  //     stream: FirebaseAuth.instance.authStateChanges(),
  //     builder: (context, snapshot) {
  //       if (!snapshot.hasData) {
  //         return const SignInScreen(
  //           providers: [],
  //         );
  //       }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) 
        {
          return SignInScreen(
            providers: [
              EmailAuthProvider(), // new
              // GoogleProvider(clientId: "YOUR_WEBCLIENT_ID"),  // new
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return const Padding(
                padding:  EdgeInsets.all(20),
                child: AspectRatio(
                aspectRatio: 1,
                
                ),
              );
            },

             subtitleBuilder: (context, action) {
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 8.0),
               child: action == AuthAction.signIn
                   ? const Text('Welcome to FlutterFire, please sign in!')
                   : const Text('Welcome to Flutterfire, please sign up!'),
             );
           },
           
           sideBuilder: (context, shrinkOffset) {
             return Padding(
               padding:  EdgeInsets.all(20),
               child: AspectRatio(
                 aspectRatio: 1,
                 child: Image.asset('assets/logo.jpg', width: 100.0, height: 100.0),
               ),
             );
           },


          );
        }

        return const Tasks();
      },
    );
  }
}
