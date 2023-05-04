import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../screens/home_screen.dart';

import '/auth.dart';

    class Auth extends StatelessWidget {
      const Auth({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return LoginScreen();
              }
            }),
          ),
        );
      }
    }
