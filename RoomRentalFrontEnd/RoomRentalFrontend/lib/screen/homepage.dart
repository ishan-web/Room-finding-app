import 'dart:async';

import 'package:room_finder/admin/search_page.dart';
import 'package:room_finder/admin/view_my_order.dart';
import 'package:room_finder/model/product.dart';
import 'package:room_finder/screen/login_screen.dart';
import 'package:room_finder/screen/productuserdetail.dart';
import 'package:room_finder/screen/searchuserpage.dart';
import 'package:room_finder/services/product_service.dart';
import 'package:room_finder/utils/configs.dart';
import 'package:room_finder/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'aboutus.dart';
import 'contactus.dart';
import 'faq.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<double>? _accelerometerValues;

  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();
    Provider.of<MyProduct>(context, listen: false).getproduct(context);
    super.initState();

    _streamSubscriptions.add(
      accelerometerEvents.listen(
        (AccelerometerEvent event) {
          setState(() {
            _accelerometerValues = <double>[event.x, event.y, event.z];

            print(_accelerometerValues);

            if (event.x >= 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchUserPage()),
              );
            }
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  dynamic offline = SharedServices.getHomePageData();

  late List<ProductElement>? products;
  String query = '';
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
    dynamic value = SharedServices.getHomePageData();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          children: [
            DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/sr.jpg'))),
                child: Stack(children: const [
                  Positioned(
                    bottom: 110.0,
                    left: 18.0,
                    child: Text(
                      "Room finding",
                      style: TextStyle(
                          color: Color.fromARGB(255, 43, 54, 30),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ])),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(10),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 15),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ViewMyOrder()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color.fromARGB(255, 13, 78, 35),
                  ),
                  Text(
                    "View liked rooms",
                    style: TextStyle(
                      color: Color.fromARGB(255, 13, 78, 35),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 13, 78, 35),
              thickness: 1,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              color: Colors.white,
              child: TextButton(
                style: TextButton.styleFrom(
                  // backgroundColor: const Color(0xfff06127),
                  padding: const EdgeInsets.all(10),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AboutUs()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove_red_eye_sharp,
                      color: Color.fromARGB(255, 13, 78, 35),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "About Us",
                      style: TextStyle(
                          color: Color.fromARGB(255, 13, 78, 35),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 13, 78, 35),
              thickness: 1,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              color: Colors.white,
              child: TextButton(
                style: TextButton.styleFrom(
                  // backgroundColor: const Color(0xfff06127),
                  padding: const EdgeInsets.all(10),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ContactUs()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.contact_mail_outlined,
                      color: Color.fromARGB(255, 13, 78, 35),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Contact Us",
                      style: TextStyle(
                          color: Color.fromARGB(255, 13, 78, 35),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 13, 78, 35),
              thickness: 1,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              color: Colors.white,
              child: TextButton(
                style: TextButton.styleFrom(
                  // backgroundColor: const Color(0xfff06127),
                  padding: const EdgeInsets.all(10),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => FAQ()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.repeat_one,
                      color: Color.fromARGB(255, 13, 78, 35),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "FAQs",
                      style: TextStyle(
                          color: Color.fromARGB(255, 13, 78, 35),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 13, 78, 35),
              thickness: 1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 13, 78, 35),
                  padding: const EdgeInsets.all(15),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  SharedServices.logout();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen()),
                    (route) => false,
                  );
                  Fluttertoast.showToast(
                    msg: "Successfully Logged Out",
                    toastLength: Toast.LENGTH_LONG,
                    fontSize: 12,
                    textColor: Colors.black,
                    backgroundColor: Colors.grey[100],
                  );
                },
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 78, 35),
        title: const Text("Rental"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchUserPage()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.indigo.shade100,
                Colors.indigo.shade50,
              ])),
          child: Column(
            children: [
              Consumer<MyProduct>(builder: (context, product, child) {
                // product.getproduct(context);
                // final oldValue = product.value?.length;
                // product.getproduct(context);
                if (product.value?.isEmpty == true
                    // &&
                    //     oldValue != product.value?.length
                    ) {
                  return Center(
                      child: Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text("Empty")));
                } else {
                  return Column(
                    children: [
                      Container(
                        height: 150,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(2),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/sr.jpg'),
                          ),
                        ),
                      ),
                      ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: product.value?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 2,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductUserDetail(
                                                  id: (product.value?[index].id)
                                                      .toString(),
                                                  name: (product
                                                          .value?[index].name)
                                                      .toString(),
                                                  image: (product
                                                          .value?[index].image)
                                                      .toString(),
                                                  // NetworkImage(
                                                  //     Configs.mainURL +
                                                  //         // "/" +
                                                  //         // "${product.value?[index].image}"
                                                  //         "/uploads/image-1644773012939.png"
                                                  //     // "${product.value?[index].image}"

                                                  //     ),
                                                  brand: (product
                                                          .value?[index].brand)
                                                      .toString(),
                                                  category: (product
                                                          .value?[index]
                                                          .category)
                                                      .toString(),
                                                  price: (product
                                                          .value?[index].price)!
                                                      .toInt(),
                                                  description: (product
                                                          .value?[index]
                                                          .description)
                                                      .toString(),
                                                  productid:
                                                      (product.value?[index].id)
                                                          .toString(),
                                                  availableVehicle: ((product
                                                          .value?[index]
                                                          .availableVehicle)
                                                      .toString()),
                                                )),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 150,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 13, 78, 35),
                                              // shape: BoxShape.circle,
                                              // color: Colors.grey,
                                              // border: Border.all(
                                              //     color: const Color(0xfff06127), style: BorderStyle.solid),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(Configs
                                                        .mainURL +
                                                    '/uploads/' +
                                                    product.value![index].image
                                                        .toString()),
                                              ),
                                            ),
                                          ),
                                          space(),
                                          Text(
                                              "item : ${(product.value?[index].name).toString()}",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 13, 78, 35),
                                                fontSize: 16,
                                              )),
                                          space(),
                                          Text(
                                              "\$\$\$ ${(product.value?[index].price).toString()}",
                                              style: TextStyle(
                                                color: Colors.red[600],
                                                fontSize: 16,
                                              )),
                                          space(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox space() {
    return const SizedBox(
      height: 5,
    );
  }
}
