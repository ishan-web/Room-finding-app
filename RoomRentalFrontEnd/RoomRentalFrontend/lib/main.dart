import 'package:room_finder/screen/car_details.dart';
import 'package:room_finder/screen/homepage.dart';
import 'package:room_finder/screen/login_screen.dart';
import 'package:room_finder/services/get_rent_services.dart';
import 'package:room_finder/services/product_service.dart';
import 'package:room_finder/services/searchProduct_api.dart';
import 'package:room_finder/services/view_my_order_services.dart';
import 'package:room_finder/utils/shared_preference.dart';
import 'package:room_finder/utils/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MyProduct()),
    ChangeNotifierProvider(create: (_) => TimeProvider()),
    ChangeNotifierProvider(create: (_) => GetRent()),
    ChangeNotifierProvider(create: (_) => SearchProduct()),
    ChangeNotifierProvider(create: (_) => ViewMyOrders()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catering',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 4, 61, 28),
      ),
      home: LoginScreen(),
    );
  }
}
