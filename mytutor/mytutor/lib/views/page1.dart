import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants.dart';
import '../models/subject.dart';
import '../models/user.dart';
import 'cartscreen.dart';

//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:mytutor/models/user.dart';
//import 'package:mytutor/views/mainscreeen.dart';

class Page1 extends StatefulWidget {
  final User user;
  const Page1({Key? key, required this.user}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<Subject> subjectList = <Subject>[];
  String titlecenter = "Loading...";
  late double screenHeight, screenWidth, resWidth;
  //final df = DateFormat('dd/MM/yyyy hh:mm a');
  var numofpage, curpage = 1;
  var color;
  int cart = 0;
  TextEditingController searchController = TextEditingController();
  String search = "";

  @override
  void initState() {
    super.initState();
    _loadSubjects(1, search);
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
      appBar: AppBar(
        title: const Text('MyTutor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _loadSearchDialog();
            },
          ),
          TextButton.icon(
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => CartScreen(
                            user: widget.user,
                          )));
              //_loadSubjects(1, search, "All");//
              _loadMyCart(); //
            },
            // },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            label: Text(widget.user.cart.toString(),
                style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: subjectList.isEmpty
          ? Center(
              child: Text(titlecenter,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)))
          : Column(children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text("Subjects Available",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: (1 / 1),
                      children: List.generate(subjectList.length, (index) {
                        return InkWell(
                          splashColor: Colors.amber,
                          onTap: () => {_loadSubjectsDetails(index)},
                          child: Card(
                              child: Column(
                            children: [
                              Flexible(
                                flex: 5,
                                child: CachedNetworkImage(
                                  imageUrl: CONSTANTS.server +
                                      "/mytutor/mobile/assets/assets/courses/" +
                                      subjectList[index].subjectId.toString() +
                                      '.jpg',
                                  fit: BoxFit.cover,
                                  width: resWidth,
                                  placeholder: (context, url) =>
                                      const LinearProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Flexible(
                                  flex: 5,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: Column(children: [
                                              Text(
                                                  subjectList[index]
                                                      .subjectName
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center),
                                              Text("RM " +
                                                  double.parse(
                                                          subjectList[index]
                                                              .subjectPrice
                                                              .toString())
                                                      .toStringAsFixed(2)),
                                            ]),
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: IconButton(
                                                  onPressed: () {
                                                    //_addtocartDialog(index);
                                                    _showDialog(index);
                                                  },
                                                  icon: const Icon(
                                                      Icons.shopping_cart))),
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                        );
                      }))),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: numofpage,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if ((curpage - 1) == index) {
                      color = Colors.cyan;
                    } else {
                      color = Colors.black;
                    }
                    return SizedBox(
                      width: 40,
                      child: TextButton(
                          onPressed: () => {
                                _loadSubjects(index + 1,
                                    search) //onPressed: () => {_loadProducts(index + 1, "")
                              },
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(color: color),
                          )),
                    );
                  },
                ),
              ),
            ]),
    );
  }

  _loadSubjectsDetails(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.lightBlue[50],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Text(
              "Subject Details",
              style: TextStyle(),
            ),
            content: SingleChildScrollView(
                child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: CONSTANTS.server +
                      "/mytutor/mobile/assets/assets/courses/" +
                      subjectList[index].subjectId.toString() +
                      '.jpg',
                  fit: BoxFit.cover,
                  width: resWidth,
                  placeholder: (context, url) =>
                      const LinearProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Text(
                  subjectList[index].subjectName.toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Subject Description: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(subjectList[index].subjectDesc.toString()),
                      ]),
                  Row(children: [
                    const Text("Price: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Expanded(
                        child: Text("RM " +
                            double.parse(
                                    subjectList[index].subjectPrice.toString())
                                .toStringAsFixed(2))),
                  ]),
                  Row(children: [
                    const Text("Subject Sessions: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Expanded(
                        child: Text(
                            subjectList[index].subjectSessions.toString() +
                                " units")),
                  ]),
                  Row(children: [
                    const Text("Subject Rating: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Expanded(
                        child:
                            Text(subjectList[index].subjectRating.toString())),
                  ]),
                ]),
              ],
            )),
            actions: [
              Column(
                children: [
                  SizedBox(
                      width: screenWidth / 1,
                      child: ElevatedButton(
                          onPressed: () {
                            _addtoCart(index);
                          },
                          child: const Text("Add to cart"))),
                  TextButton(
                    child: const Text(
                      "Close",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }

  void _loadSubjects(int pageno, String _search) {
    curpage = pageno;
    numofpage ?? 1;
    http.post(
        Uri.parse(CONSTANTS.server + "/mytutor/mobile/php/load_subjects.php"),
        body: {
          'pageno': pageno.toString(),
          'search': _search,
        }).then((response) {
      print(response.body);
      print(response.statusCode);
      var jsondata = jsonDecode(response.body);

      print(jsondata);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        var extractdata = jsondata['data'];
        numofpage = int.parse(jsondata['numofpage']);

        if (extractdata['subjects'] != null) {
          subjectList = <Subject>[];
          extractdata['subjects'].forEach((v) {
            subjectList.add(Subject.fromJson(v));
          });
          titlecenter = subjectList.length.toString() + " Subjects Available";
        } else {
          titlecenter = "No Subjects Available";
          subjectList.clear();
        }
        setState(() {});
      } else {
        titlecenter = "No Subjects Available";
        subjectList.clear();
        setState(() {});
      }
    });
  }

  void _loadSearchDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return StatefulBuilder(
            builder: (context, StateSetter setState) {
              return AlertDialog(
                  backgroundColor: Colors.indigo[50],
                  title: const Text(
                    "Search ",
                  ),
                  content: SizedBox(
                    height: screenHeight / 5.8,
                    child: Column(
                      children: [
                        TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              labelText: 'Search',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                        const SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            search = searchController.text;
                            Navigator.of(context).pop();
                            _loadSubjects(1, search);
                          },
                          child: const Text("Search"),
                        )
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text(
                        "Close",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ]);
            },
          );
        });
  }

  void _showDialog(index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "ADD TO CART",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: const Text("Are you sure?", style: TextStyle()),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                _addtoCart(index);
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

  void _loadMyCart() {
    http.post(
        Uri.parse(CONSTANTS.server + "/mytutor/mobile/php/load_mycartqty.php"),
        body: {
          "email": widget.user.email.toString(),
        }).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    ).then((response) {
      print(response.body);
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        print(jsondata['data']['carttotal'].toString());
        setState(() {
          widget.user.cart = jsondata['data']['carttotal'].toString();
        });
      }
    });
  }

  void _addtoCart(int index) {
    http.post(
        Uri.parse(CONSTANTS.server + "/mytutor/mobile/php/insert_cart.php"),
        body: {
          "email": widget.user.email.toString(),
          "prid": subjectList[index].subjectId.toString(),
        }).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    ).then((response) {
      print(response.body);
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        print(jsondata['data']['carttotal'].toString());
        setState(() {
          widget.user.cart = jsondata['data']['carttotal'].toString();
        });
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14.0);
      }
    });
  }
}

//}
