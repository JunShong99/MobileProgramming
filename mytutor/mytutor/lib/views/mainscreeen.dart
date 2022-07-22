// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mytutor/views/loginscreen.dart';
import 'package:mytutor/views/registerscreen.dart';

class MyTutor extends StatefulWidget {
  const MyTutor({Key? key}) : super(key: key);

  @override
  State<MyTutor> createState() => _MyTutorState();
}

class _MyTutorState extends State<MyTutor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 90, 0, 10),
                child: Center(
                    child: Column(
                  children: [
                    const Text(
                      "HEY THERE, WELCOME TO MY TUTOR!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
              )),
          Flexible(
              flex: 4,
              child: Center(
                  child: Container(
                      constraints: BoxConstraints.expand(),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/bookstore (3).png"),
                            fit: BoxFit.cover),
                      )))),
          Flexible(flex: 4, child: (BookForm()))
        ]),
      ),
    );
  }
}

class BookForm extends StatefulWidget {
  const BookForm({Key? key}) : super(key: key);

  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 100),
      SizedBox(
        width: 360,
        height: 50,
        child: ElevatedButton(
          child: const Text(
            "Login",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          onPressed: _loginUser,
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        width: 360,
        height: 50,
        child: ElevatedButton(
          child: const Text(
            "Register",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          onPressed: _registerUser,
        ),
      ),
      const SizedBox(height: 30),
      Text(
        "Version 1.0",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      )
    ]);
  }

  void _loginUser() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (content) => LoginScreen(
                // admin: admin,
                )));
  }

  void _registerUser() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (content) => RegisterScreen(
                // admin: admin,
                )));
  }
}
