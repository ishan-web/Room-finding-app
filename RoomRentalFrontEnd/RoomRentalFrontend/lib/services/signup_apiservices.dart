// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:room_finder/model/error_model.dart';
import 'package:room_finder/model/sign_up_model.dart';
import 'package:room_finder/utils/configs.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

Future<dynamic> signUpCustomer(
  String name,
  String email,
  String password,
) async {
  late SignUp model;
  // late ErrorModel errorModel = ErrorModel();

  // try {
  var body = {
    "name": name,
    "email": email,
    "password": password,
  };
  var response = await http.post(
    Uri.parse(Configs.signUp),
    body: jsonEncode(body),
    headers: {
      // "Authorization": "Bearer $token",
      "Access-Control-Allow-Origin": "/",
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 201) {
    model = signUpFromJson(response.body);
    return model;
  } else {
    // errorModel = errorModelFromJson(response.body);
    // return errorModel;
    return Fluttertoast.showToast(
      msg: "Error ! \nPlease Try Again Later.",
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 20.0,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.red[800],
    );
    // return Toast
    // loginErrorModel = errorModelFromJson(response.body);
    // return loginErrorModel;
  }
  // } catch (e) {
  //   Future.error(e);
  // }
}
