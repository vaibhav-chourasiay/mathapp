// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tranbrean/apptheme.dart';
import 'package:tranbrean/models.dart';

import 'globalob.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ob.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BrainTrean",
      theme: Mytheme.light,
      darkTheme: ThemeData.dark(),
      themeMode: ob.thememode,
      debugShowCheckedModeBanner: false,
      home: SamplePage(),
    );
  }
}

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  bool darktheme = false;
  Models? obj;
  int corrects = 0;
  List l = [];
  String sp = "+";
  String level = "easy";

  @override
  void initState() {
    super.initState();
    getvalues("+");
  }

  getvalues(operatorvalue, [String? level = "easy"]) {
    obj = Models(operatorvalue: operatorvalue, selected: level!);
    obj!.initilized();
    obj!.cal();
    l = obj!.rvaluegen();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: 10.0,
                right: 10.0,
                left: 10.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Switch(
                                      value: darktheme,
                                      onChanged: (value) {
                                        darktheme = value;

                                        ob.changetheme();
                                        setState(() {});
                                      }),
                                  title: Text("DartTheme :"),
                                );
                              });
                        },
                        child: Image.asset(
                          "assets/drawer.png",
                          width: 46.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "BrainTrain",
                        style: GoogleFonts.poppins(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Select Diffeculty Level :",
                                  ),
                                  content: DropdownButton(
                                      value: level,
                                      onChanged: (String? value) {
                                        Navigator.pop(context);
                                        getvalues(sp, value);
                                        setState(() {
                                          level = value!;
                                        });
                                      },
                                      items: const [
                                        DropdownMenuItem(
                                          value: "easy",
                                          child: Text("easy"),
                                        ),
                                        DropdownMenuItem(
                                          value: "medium",
                                          child: Text("medium"),
                                        ),
                                        DropdownMenuItem(
                                          value: "hard",
                                          child: Text("hard"),
                                        ),
                                      ]),
                                );
                              });
                        },
                        child: Image.asset(
                          "assets/dropdown.png",
                          width: 52,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                left: MediaQuery.of(context).size.width * 0.07,
                // right: 25.0,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 20.0,
                  child: Container(
                    width: 300.0,
                    height: 48.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: DropdownButton(
                      alignment: Alignment.center,
                      style: GoogleFonts.poppins(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        letterSpacing: -1,
                      ),
                      value: sp,
                      onChanged: (String? value) {
                        getvalues(value);
                        setState(() {
                          sp = value!;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: "+",
                          child: Text("+"),
                        ),
                        DropdownMenuItem(
                          value: "-",
                          child: Text("-"),
                        ),
                        DropdownMenuItem(
                          value: "*",
                          child: Text("*"),
                        ),
                        DropdownMenuItem(
                          value: "/",
                          child: Text("/"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.27,
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 20.0,
                  child: Container(
                    width: 350.0,
                    height: 185.0,
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 10.0,
                      right: 0.0,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/b.jpg",
                              height: 152.0,
                              width: 148.0,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "${obj!.operatorvalue}",
                              style: GoogleFonts.poppins(
                                fontSize: 48.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 28.0,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${obj!.firstvalue}",
                              style: GoogleFonts.poppins(
                                fontSize: 48.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${obj!.secondvalue}",
                              style: GoogleFonts.poppins(
                                fontSize: 48.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                // bottom: MediaQuery.of(context).size.height * 0.2,
                // bottom: 20.0,

                top: MediaQuery.of(context).size.height * 0.6,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,

                child: Container(
                  height: 180.0,
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: GridView.builder(
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 2.0,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (obj!.clicked == false) {
                              if (obj!.answervalue == l[index]["value"]) {
                                l[index]["color"] = Colors.green;
                                corrects++;
                              } else {
                                l[index]["color"] = Colors.red;
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                            "Number of Corrects = $corrects"),
                                        title: Text("Score :"),
                                      );
                                    });
                              }

                              setState(() {
                                obj!.clicked = true;
                              });
                              Future.delayed(Duration(seconds: 1), () {
                                setState(() {
                                  getvalues(sp, level);
                                });
                              });
                            }
                          },
                          child: Text(
                            (l[index]["value"].toString().contains(".") &&
                                    l[index]["value"].toString().length > 3)
                                ? l[index]["value"].toString().substring(0, 4)
                                : l[index]["value"].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(
                              20.0,
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              l[index]["color"],
                            ),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                          ),
                        ),
                      );
                    },
                    itemCount: l.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Number of Corrects = $corrects"),
                  title: Text("Score :"),
                );
              });
        },
        child: Text(
          "+",
          style: GoogleFonts.poppins(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
