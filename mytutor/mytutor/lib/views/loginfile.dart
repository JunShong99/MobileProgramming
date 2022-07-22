// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers


import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mytutor/models/user.dart';
import 'package:mytutor/views/mainscreeen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mytutor/views/page1.dart';
import 'package:mytutor/views/page2.dart';
import 'package:mytutor/views/page3.dart';
import 'package:mytutor/views/page4.dart';
import 'package:mytutor/views/page5.dart';
//import '../constants.dart';
//import '../models/subject.dart';

const String page1 = "Subjects";
const String page2 = "Tutors";
const String page3 = "Subscribe";
const String page4 = "Favourite";
const String page5 = "Profile";
const String title = "Demo";

class LoginFile extends StatefulWidget {
  final User user;
  const LoginFile({Key? key, required this.user}) : super(key: key);

  @override
  State<LoginFile> createState() => _LoginFileState();
}

class _LoginFileState extends State<LoginFile> {
  late double screenHeight, screenWidth, resWidth;
  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late Widget _page3;
  late Widget _page4;
  late Widget _page5;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    //_loadProducts(1, search);

    _page1 = Page1(user: widget.user,);
    _page2 = Page2();
    _page3 = Page3();
    _page4 = Page4();
    _page5 = Page5(user: widget.user,);//  _page5 = Page5(changePage: _changeTab);
    _pages = [_page1, _page2, _page3, _page4, _page5];
    _currentIndex = 0;
    _currentPage = _page1;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
      //rowcount = 2;
    } else {
      resWidth = screenWidth * 0.75;
      //rowcount = 3;
    }
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _changeTab(index);
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: page1,
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.book),
            ),
            BottomNavigationBarItem(
              label: page2,
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.perm_identity),
            ),
            BottomNavigationBarItem(
              label: page3,
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.subscriptions),
            ),
            BottomNavigationBarItem(
              label: page4,
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.folder_special),
            ),
            BottomNavigationBarItem(
              label: page5,
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.person),
            ),
          ]),
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              _navigationItemListTitle(page1, 0),
              _navigationItemListTitle(page2, 1),
              _navigationItemListTitle(page3, 2),
              _navigationItemListTitle(page4, 3),
              _navigationItemListTitle(page5, 4),
              _createDrawerItem(
                icon: Icons.exit_to_app,
                text: 'Logout',
                onTap: () {
                  _yesno();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  void _yesno() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "Logout",
            style: TextStyle(),
          ),
          content: const Text("Are you sure?", style: TextStyle()),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () async {
                // Navigator.of(context).pop();

                Fluttertoast.showToast(
                    msg: "Logout Successfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    fontSize: 16.0);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (content) => MyTutor(
                            //user: widget.user,
                            )));

 
              },
            ),
            TextButton(
              child: const Text(
                "No",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  Widget _navigationItemListTitle(String title, int index) {
    return ListTile(
      title: Text(
        '$title Page',
        style: TextStyle(color: Colors.blue[400], fontSize: 22.0),
      ),
      onTap: () {
        Navigator.pop(context);
        _changeTab(index);
      },
    );
  }
}



