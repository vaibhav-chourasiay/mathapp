import 'dart:math';

import 'package:flutter/material.dart';

class Models {
  num? firstvalue;
  num? secondvalue;
  num? answervalue;
  String operatorvalue;
  String selected;
  bool clicked = false;
  Models(
      {this.firstvalue = 00,
      this.secondvalue = 00,
      this.answervalue = 00,
      this.selected = "easy",
      required this.operatorvalue});

  num? cal() {
    if (operatorvalue == "+") {
      answervalue = firstvalue! + secondvalue!;
    } else if (operatorvalue == "-") {
      answervalue = firstvalue! - secondvalue!;
    } else if (operatorvalue == "*") {
      answervalue = firstvalue! * secondvalue!;
    } else if (operatorvalue == "/") {
      answervalue = firstvalue! / secondvalue!;
    }
    return answervalue;
  }

  initilized() {
    var r = Random();

    if (selected == "easy") {
      firstvalue = r.nextInt(10) + r.nextInt(5);
      secondvalue = r.nextInt(10) + r.nextInt(5);
    } else if (selected == "medium") {
      firstvalue = r.nextInt(100) + r.nextInt(5);
      secondvalue = r.nextInt(100) + r.nextInt(5);
    } else if (selected == "hard") {
      firstvalue = r.nextInt(1000) + r.nextInt(5);
      secondvalue = r.nextInt(1000) + r.nextInt(5);
    }
  }

  List rvaluegen() {
    List sendinglist = [];
    var r = Random();
    var p = r.nextInt(4);
    // print("p=$p");
    for (int i = 0; i < 4; i++) {
      if (p == i) {
        sendinglist.add({"value": answervalue, "color": Colors.white});
      } else {
        sendinglist.add(
            {"value": answervalue! + r.nextInt(20), "color": Colors.white});
      }
    }
    return sendinglist;
  }
}
