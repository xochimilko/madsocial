import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madsocialproj2/firebase_options.dart';
import 'package:madsocialproj2/screens/homescreen.dart';
import 'package:madsocialproj2/screens/maincontainer.dart';
import 'package:madsocialproj2/screens/registrationscreen.dart';
import 'package:madsocialproj2/services/authservice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:madsocialproj2/screens/loginscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('Error');
          print(snapshot.error);
          return MaterialApp(home: Scaffold(body: Text('Something is wrong')));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print('Success');
          return MaterialApp(home: LoginScreen());
        }

        // Otherwise, show something whilst waiting for initialization to complete
        print('Loading');
        return MainContainer();
      },
    );
  }
}
