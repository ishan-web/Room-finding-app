import 'package:room_finder/services/view_my_order_services.dart';
import 'package:room_finder/utils/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewMyOrder extends StatefulWidget {
  ViewMyOrder({Key? key}) : super(key: key);

  @override
  State<ViewMyOrder> createState() => _ViewMyOrderState();
}

class _ViewMyOrderState extends State<ViewMyOrder> {
  @override
  void initState() {
    super.initState();
    Provider.of<ViewMyOrders>(context, listen: false).viewOrder(context);
  }

  @override
  Widget build(BuildContext context) {
    final timeDate = Provider.of<TimeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("View All Room Orders"),
        backgroundColor: Color.fromARGB(255, 13, 78, 35),
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<ViewMyOrders>(builder: (context, rent, child) {
        if (rent.value?.isEmpty == true) {
          return Center(
              child: Container(
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                    "Empty",
                    style: TextStyle(fontSize: 20),
                  )));
        } else {
          return SingleChildScrollView(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      color: Color.fromARGB(255, 13, 78, 35),
                      child: const Text(
                        "Here are the list of orders you have done so far.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: rent.value?.length,
                        itemBuilder: (BuildContext context, int index) {
                          // DateTime from = DateTime.
                          // String durationFrom = DateFormat('d MMM yyy').format((rent.value?[index].durationFrom).toString());
                          return Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Text(
                                          //     "Ordered By - ${(rent.value?[index].user?.name).toString()}"),

                                          // const Text("Order Item"),

                                          Container(
                                            padding: EdgeInsets.all(6),
                                            color:
                                                Color.fromARGB(255, 13, 78, 35),
                                            child: Text(
                                              "Current address",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Street Location : ${(rent.value?[index].pickingAddress?.address).toString()}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.indigo[800],
                                            ),
                                          ),
                                          Text(
                                            "City : ${(rent.value?[index].pickingAddress?.city).toString()}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.indigo[800],
                                            ),
                                          ),
                                          Text(
                                            "Country : ${(rent.value?[index].pickingAddress?.country).toString()}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.indigo[800],
                                            ),
                                          ),
                                          Text(
                                            "Postal Code : ${(rent.value?[index].pickingAddress?.postalCode).toString()}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.indigo[800],
                                            ),
                                          ),
                                          Divider(
                                            color:
                                                Color.fromARGB(255, 13, 78, 35),
                                            thickness: 2,
                                          ),
                                          Text(
                                            "Location: ${(rent.value?[index].rentItem?.name).toString()}",
                                            // textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.indigo[900]),
                                          ),
                                          Text(
                                            "Price \$:${(rent.value?[index].rentItem?.price).toString()}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.red[600]),
                                          ),
                                          // const SizedBox(
                                          //   height: 10,
                                          // ),
                                          Divider(
                                            color:
                                                Color.fromARGB(255, 13, 78, 35),
                                            thickness: 2,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            color:
                                                Color.fromARGB(255, 13, 78, 35),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                const Text(
                                                  "Order duration",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      "From -\n${timeDate.getDate((rent.value?[index].durationFrom).toString())}",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "To - \n${timeDate.getDate((rent.value?[index].durationTo).toString())}",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
