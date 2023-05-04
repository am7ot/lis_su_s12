import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  void openSignupScreen() {
    Navigator.of(context).pushReplacementNamed('signupScreen');
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdff6ff),
      body: Center(
        child: Stack(
            children: [
              //Image
              FractionallySizedBox(
                widthFactor: 1.4,
                heightFactor: 1.3,
                child: Transform.rotate(
                  angle: 0.1,
                  // Rotate the image by -0.1 radians (about -5.7 degrees)
                  child: Image.asset(
                    'images/shape.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 30,
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 55,
                left: 30,
                child: Text(
                  'BOSS.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //Logo image
              Positioned(
                top: 150,
                left: 165,
                child: Image.asset(
                  'images/logo.png',
                  width: 70,
                ),
              ),
              // Body of the Scaffold widget
              Center(
                child: SizedBox(
                  height: 400, // Fixed height for SingleChildScrollView
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 60),
                        //Title
                        Text(
                          'SIGN IN',
                          style: GoogleFonts.robotoCondensed(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF47b5ff)),
                        ),
                        //Subtitle
                        SizedBox(
                          height: 50, //sign in word above email
                        ),
                        //Email TextField
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                  hintText: 'Email',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        //Password
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                  hintText: 'Password',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        //sign in button
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 40),
                          child: GestureDetector(
                            onTap: signIn,
                            child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF47b5ff),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Sign in',
                                style: GoogleFonts.robotoCondensed(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ),
                        SizedBox(height: 10),
                        //signup
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New Here? ',
                              style: GoogleFonts.robotoCondensed(
                                color: Color(0xFF3d3d3d),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: openSignupScreen,
                                child: Text(
                              'Sign Up Today!',
                              style: GoogleFonts.robotoCondensed(
                                color: Color(0xFF47b5ff),
                                fontWeight: FontWeight.bold,
                              ),
                                )
                            ),
                          ],
                        ), // closing bracket for Row widget
                      ], // closing bracket for SingleChildScrollView widget
                    ), // closing bracket for SizedBox widget
                  ), // closing bracket for Center widget
                ), // closing bracket for Stack widget
              )
            ]), // add semicolon here
        ),
      );
    }
}