import 'dart:convert';

import 'package:room_finder/model/getOrdersAdmin_model.dart';
import 'package:room_finder/model/get_rent.dart';
import 'package:room_finder/model/renting_model.dart';
import 'package:room_finder/utils/configs.dart';
import 'package:room_finder/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class GetRent extends ChangeNotifier {
  List<AllOrderAdmin>? _check = [];
  List<AllOrderAdmin>? get value => _check;

  Future<dynamic> rentProduct(
    context,
  ) async {
    String? token = await SharedServices.loginDetails();
    var response = await http.get(
      Uri.parse(Configs.rent),
      headers: {
        "Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "/",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      var modelProduct = allOrderAdminFromJson(response.body);
      _check = modelProduct;
      notifyListeners();
      return modelProduct;
    } else {
      Fluttertoast.showToast(
        msg: "Error ! \nPlease try again later.",
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20.0,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.red[800],
      );
    }
  }
}
