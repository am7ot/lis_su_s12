import 'package:flutter/material.dart';
import '/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import '/screens/signup_screen.dart';

import '/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const Auth(),
      routes: {
        '/':(context) => const Auth(),
        //'homeScreen':(context) => const HomeScreen(),
        'signupScreen':(context) => const SignupScreen(),
        'LoginScreen':(context) => const LoginScreen(),
      },
    );
  }
}

