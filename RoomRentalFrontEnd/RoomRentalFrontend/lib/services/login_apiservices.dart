// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:room_finder/model/error_model.dart';
import 'package:room_finder/model/login_model.dart';
import 'package:room_finder/utils/configs.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

Future<dynamic> login(String email, String password) async {
  late Login model;
  // try {
  // var token =
  //     "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ0YWlsIjoiMTY0MjUxNjc5MDEyMiIsInpvbmVJZCI6IkFzaWEvS2F0aG1hbmR1Iiwic3ViIjoic3VqYW5zdGhhNDA2QGdtYWlsLmNvbSIsImlhdCI6MTY0MjUxNjc5MCwiZXhwIjoxNjQzMTIxNTkwfQ.AgoAICFcT5aKwArpN6PFevXLViS1cupLutW3a1W3aZI";
  var body = {
    "email": email,
    "password": password,
  };
  var response = await http.post(
    Uri.parse(Configs.login),
    body: jsonEncode(body),
    headers: {
      // "Authorization": "Bearer $token",
      "Access-Control-Allow-Origin": "/",
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200) {
    model = loginFromJson(response.body);
    return model;
  } else {
    Fluttertoast.showToast(
      msg: "Error ! \nIncorrect Email or Password.",
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 20.0,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.red[800],
    );
  }
  // } catch (e) {
  //   Future.error(e);
  //   return Fluttertoast.showToast(
  //     msg: "${Future.error(e)}",
  //     // "Error ! \nPlease Try Again Later.",
  //     toastLength: Toast.LENGTH_SHORT,
  //     fontSize: 20.0,
  //     timeInSecForIosWeb: 1,
  //     textColor: Colors.white,
  //     backgroundColor: Colors.red[800],
  //   );
  // }
  // on SocketException {
  //   print("socketexception e2");
  // }
}
