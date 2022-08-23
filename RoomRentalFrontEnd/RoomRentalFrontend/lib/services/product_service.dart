import 'dart:convert';
import 'package:room_finder/model/deleteProduct_model.dart';
import 'package:room_finder/model/product.dart';
import 'package:room_finder/services/delete_product_api.dart';
import 'package:room_finder/utils/configs.dart';
import 'package:room_finder/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class MyProduct extends ChangeNotifier {
  List<ProductElement>? _check = [];
  List<ProductElement>? get value => _check;

  Future<dynamic> getproduct(context) async {
    var response = await http.get(
      Uri.parse(Configs.product),
    );
    if (response.statusCode == 200) {
      var modelProduct = productFromJson(response.body);
      _check = modelProduct.products;
      // SharedServices.setHomePageData(value);
      notifyListeners();
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

  Future<dynamic> delproduct(
    String id,
    context,
  ) async {
    String? token = await SharedServices.loginDetails();
    var response = await http.delete(
      Uri.parse(Configs.product + "/" + id),
      headers: {
        "Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "/",
        "Content-Type": "application/json",
      },
      // body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      var delProduct = deleteProductFromJson(response.body);
      // notifyListeners();
      await getproduct(context);
      return delProduct;
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

    // notifyListeners();
  }
}
