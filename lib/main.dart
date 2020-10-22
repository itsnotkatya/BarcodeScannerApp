import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'src/enter_form.dart';
import 'src/scan/scan_form.dart';
import 'src/scan/scan_overlay.dart';
import 'src/data.dart';

var firstScreen = "/enter_form";
var secondScreen = "/scan_form";
var thirdScreen = "/viewer_page.dart";
var fourthScreen = "/scan_overlay.dart";
var fifthScreen = "/scan_overlay.dart";

final routes = {
  '/firstScreen': (BuildContext context) => new FormWidgetsDemo(),
  //'/secondScreen': (BuildContext context) => new QRViewExample(" "," "," "," "," "," "),
  '/thirdScreen': (BuildContext context) => new QRFirstView("","","","","","",""),
  '/fourthScreen': (BuildContext context) => new QRSecondView("","","","","","","",""),
    '/fifthScreen': (BuildContext context) => new QRThirdView("","","","","","","","",""),
};

void main() => runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: firstScreen,
        routes: {
          firstScreen: (BuildContext context) => FormWidgetsDemo(),
          //secondScreen: (BuildContext context) => QRViewExample(" "," "," "," "," "," "),
          thirdScreen: (BuildContext context) => QRFirstView("","","","","","",""),
          fourthScreen: (BuildContext context) => new QRSecondView("","","","","","","",""),
          fifthScreen: (BuildContext context) => new QRThirdView("","","","","","","","",""),
        }));
