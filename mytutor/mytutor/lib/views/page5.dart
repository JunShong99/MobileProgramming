import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';
import '../models/user.dart';
import 'mainscreeen.dart';

class Page5 extends StatefulWidget {
  final User user;
  const Page5({Key? key, required this.user}) : super(key: key);

  // const Page5({Key? key}) : super(key: key);

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  late double screenHeight, screenWidth, ctrwidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 800) {
      ctrwidth = screenWidth / 1.5;
    }
    if (screenWidth < 800) {
      ctrwidth = screenWidth / 1.1;
    }

    return Scaffold(backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('MyTutor'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              _yesno();
              //_loadSearchDialog();
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.lightBlue[50],
        child: SingleChildScrollView(
            child: Center(
                child: SizedBox(
          width: ctrwidth,
          child: Form(
            // key: _formKey,
            child: Column(children: [
              const SizedBox(height: 20),
              Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue,
                              blurRadius: 50.0,
                              spreadRadius: 10.0,
                            )
                          ],
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: CONSTANTS.server +
                                "/mytutor/mobile/assets/products/" +
                                widget.user.userId.toString() +
                                '.jpg',
                            width: 350,
                            height: 350,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text("Email: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Expanded(
                    child: Text(widget.user.email.toString(),
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.indigo,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ),
                ]),
                //const SizedBox(height: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Name : " + widget.user.name.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  Text("Number : " + widget.user.number.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  Text("Address : " + widget.user.address.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))
                ])
              ])
            ]),
          ),
        ))),
      ),
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
}
