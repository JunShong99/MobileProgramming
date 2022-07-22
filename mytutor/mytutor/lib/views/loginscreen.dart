import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mytutor/views/loginfile.dart';
import 'package:mytutor/views/mainscreeen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:mytutor/constants.dart';
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double screenHeight, screenWidth, ctrwidth;
  bool remember = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loadPref();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 800) {
      ctrwidth = screenWidth / 1.5;
    }
    if (screenWidth < 800) {
      ctrwidth = screenWidth;
    }
    return Scaffold(
        appBar: AppBar(
            title: const Text('Login'),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (content) => MyTutor()));
                })),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: ctrwidth,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: screenHeight / 2.5,
                            width: screenWidth,
                            child: Container(
                                constraints: BoxConstraints.expand(),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/bookstore (3).png"),
                                      fit: BoxFit.cover),
                                )),
                          ),
                          const Text(
                            "Login",
                            style: TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email';
                              }
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);

                              if (!emailValid) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: remember,
                                onChanged: (bool? value) {
                                  _onRememberMeChanged(value!);
                                },
                              ),
                              const Text("Remember Me")
                            ],
                          ),
                          SizedBox(
                            width: screenWidth,
                            height: 50,
                            child: ElevatedButton(
                              child: const Text("Login"),
                              onPressed: _loginUser,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _saveRemovePref(bool value) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String email = _emailController.text;
      String password = _passwordController.text;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (value) {
        await prefs.setString('email', email);
        await prefs.setString('pass', password);
        await prefs.setBool('remember', true);
        Fluttertoast.showToast(
            msg: "Preference Stored",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14.0);
      } else {
        await prefs.setString('email', '');
        await prefs.setString('pass', '');
        await prefs.setBool('remember', false);
        _emailController.text = "";
        _passwordController.text = "";
        Fluttertoast.showToast(
            msg: "Preference Removed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Preference Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
      remember = false;
    }
  }

  void _onRememberMeChanged(bool value) {
    remember = value;
    setState(() {
      if (remember) {
        _saveRemovePref(true);
      } else {
        _saveRemovePref(false);
      }
    });
  }

  Future<void> loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = (prefs.getString('email')) ?? '';
    String password = (prefs.getString('pass')) ?? '';
    remember = (prefs.getBool('remember')) ?? false;

    if (remember) {
      setState(() {
        _emailController.text = email;
        _passwordController.text = password;
        remember = true;
      });
    }
  }

  void _loginUser() {
    String _email = _emailController.text;
    String _password = _passwordController.text;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      http.post(
          Uri.parse(CONSTANTS.server + "/mytutor/mobile/php/login_user.php"),
          body: {"email": _email, "password": _password}).then((response) {
        print(response.body);
        var data = jsonDecode(response.body);
        if (response.statusCode == 200 && data['status'] == 'success') {
          User user = User.fromJson(data['data']);

          Fluttertoast.showToast(
              msg: "Success",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 16.0);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (content) => LoginFile(
                       user: user,
                      )));
        } else {
          Fluttertoast.showToast(
              msg: "Failed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 16.0);
        }
      });
    }
  }
}