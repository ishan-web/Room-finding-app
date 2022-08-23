import 'dart:convert';
import 'dart:io';
import 'package:room_finder/model/add_product_model.dart';
import 'package:room_finder/services/product_service.dart';
import 'package:room_finder/utils/configs.dart';
import 'package:room_finder/utils/shared_preference.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:provider/provider.dart';

// class AddProduct extends ChangeNotifier {
// Future<dynamic> postproduct(
//   String name,
//   String brand,
//   String category,
//   String description,
//   String availableVehicle,
//   String price,
//   File? image,
//   context,
// ) async {
//   var body = {
//     "name": name,
//     "brand": brand,
//     "category": category,
//     "description": description,
//     "availableVehicle": availableVehicle,
//     "price": price,
//     "image": image,
//   };
//   String? token = await SharedServices.loginDetails();
//   var response = await http.post(
//     Uri.parse(Configs.product),
//     headers: {
//       "Authorization": "Bearer $token",
//       "Access-Control-Allow-Origin": "/",
//       "Content-Type": "application/json",
//     },
//     body: jsonEncode(body),
//   );
//   if (response.statusCode == 201) {
//     var addProduct = addProductFromJson(response.body);
//     await Provider.of<MyProduct>(context, listen: false).getproduct(context);
//     return addProduct;
//   } else {
//     Fluttertoast.showToast(
//       msg: "Error ! \nPlease try again later.",
//       toastLength: Toast.LENGTH_SHORT,
//       fontSize: 20.0,
//       timeInSecForIosWeb: 1,
//       textColor: Colors.white,
//       backgroundColor: Colors.red[800],
//     );
//   }
// }

Future<dynamic> postproduct(
  String name,
  String brand,
  String category,
  String description,
  String availableVehicle,
  String price,
  File? image,
  context,
) async {
  String? token = await SharedServices.loginDetails();

  FormData data =
      FormData.fromMap({'image': await MultipartFile.fromFile(image!.path)});
  var response2 = await Dio().post(
    Configs.uploadImage,
    options: Options(headers: {
      "Authorization": "Bearer $token",
      "Access-Control-Allow-Origin": "/"
    }),
    data: data,
  );
  var body = {
    "name": name,
    "brand": brand,
    "category": category,
    "description": description,
    "availableVehicle": availableVehicle,
    "price": price,
    "image": response2.data,
  };
  var response = await Dio().post(
    Configs.product,
    options: Options(headers: {
      "Authorization": "Bearer $token",
      "Access-Control-Allow-Origin": "/",
      "Content-type": "application/json"
    }),
    data: jsonEncode(body),
  );
  // print(response);
  if (response.statusCode == 200 || response.statusCode == 201) {
    // var addProduct = addProductFromJson(response.data);

    await Provider.of<MyProduct>(context, listen: false).getproduct(context);
    // Navigator.pop(context);
    // Fluttertoast.showToast(
    //   msg: "Congratulations ! \n Fish has been added",
    //   toastLength: Toast.LENGTH_SHORT,
    //   fontSize: 20.0,
    //   timeInSecForIosWeb: 1,
    //   textColor: Colors.white,
    //   backgroundColor: Colors.green[800],
    // );
    // return addProduct;
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
