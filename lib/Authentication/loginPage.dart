// ignore_for_file: use_build_context_synchronously

import 'package:bhago_bharat/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final GoogleSignIn _googleSignIn;
  late final FirebaseAuth _auth;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _googleSignIn = GoogleSignIn();
    _auth = FirebaseAuth.instance;
  }

  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with the credential
      final userCredential = await _auth.signInWithCredential(credential);

      // Get the user data from the userCredential
      final user = userCredential.user;
      // final name = user!.displayName;

      // final photoUrl = user.photoURL;

      // Print the user data on the console
      // print('Name: $name');
      // print('Photo URL: $photoUrl');

      return user;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: responsive.size.height,
        width: responsive.size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 8, 78, 135),
            Color.fromARGB(255, 11, 9, 37)
          ]),
          image: DecorationImage(
              opacity: 20,
              image: AssetImage("assets/demo.jpg"),
              fit: BoxFit.contain),
        ),
        child: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  height: 60,
                  child: Image.asset("assets/nnn.jpg"),
                ),
                const SizedBox(height: 12),
                // TAG TEXT
                Text(
                  "Enabling independence through technology",
                  style: GoogleFonts.lato(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(173, 250, 250, 250),
                  ),
                ),
                const SizedBox(height: 18),
                // SIGN IN BUTTONS
                Container(
                  margin: EdgeInsets.only(top: responsive.size.height * 0.52),
                  child: Column(children: [
                    SizedBox(
                        width: responsive.size.width * 0.8,
                        child: SignInButton(
                          Buttons.GoogleDark,
                          onPressed: () async {
                            // print("Google sign in button pressed");
                            final user = await signInWithGoogle();
                            if (user != null) {
                              setState(() {
                                isLoading = true;
                                const CircularProgressIndicator();
                              });
                              // User signed in
                              // print("User signed in with Google");
                              final String? name = user.displayName;
                              // final String? photoUrl = user.photoURL;
                              // ignore: avoid_print
                              print(name);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                              setState(() {
                                isLoading = false;
                              });
                            }
                            // Error signing in
                            else {
                              setState(() {
                                isLoading = false;
                              });
                              // print("ERROR signing in ");
                            }
                          },
                        )),
                    const SizedBox(height: 1),
                    SizedBox(
                        width: responsive.size.width * 0.8,
                        child: SignInButton(Buttons.Email, onPressed: () {})),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Terms and Conditions*",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text("Contact us")),
                      ],
                    )
                  ]),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
