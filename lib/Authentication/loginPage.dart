import 'package:bhago_bharat/screens/new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context);
    return Scaffold(
      drawer: const Drawer(backgroundColor: Colors.red),
      appBar: AppBar(
        // toolbarHeight: responsive.size.height * 0.55,
        backgroundColor: const Color.fromARGB(255, 17, 55, 86),
        centerTitle: true,
        title: const Text(
          "Login Here",
          style: TextStyle(color: Colors.white),
        ),
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        color: const Color.fromARGB(255, 17, 55, 86),
        height: responsive.size.height,
        width: responsive.size.width,
        child: Column(
          children: [
            const SizedBox(height: 30),
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(55)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/nnn.jpg"),
                )),
            const SizedBox(height: 100),
            SizedBox(
                height: 50,
                width: responsive.size.width * 0.94,
                child: SignInButton(Buttons.GoogleDark, onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPage(),
                    ),
                  );
                })),
            const SizedBox(height: 10),
            SizedBox(
                height: 50,
                width: responsive.size.width * 0.94,
                child: SignInButton(Buttons.AppleDark, onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPage(),
                    ),
                  );
                })),
            const SizedBox(height: 10),
            SizedBox(
                height: 50,
                width: responsive.size.width * 0.94,
                child: SignInButton(Buttons.Email, onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPage(),
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
