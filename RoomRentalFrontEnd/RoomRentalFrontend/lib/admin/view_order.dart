import 'package:room_finder/services/get_rent_services.dart';
import 'package:room_finder/utils/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ViewAdminOrders extends StatefulWidget {
  ViewAdminOrders({Key? key}) : super(key: key);

  @override
  State<ViewAdminOrders> createState() => _ViewAdminOrdersState();
}

class _ViewAdminOrdersState extends State<ViewAdminOrders> {
  @override
  void initState() {
    super.initState();
    Provider.of<GetRent>(context, listen: false).rentProduct(context);
  }

  @override
  Widget build(BuildContext context) {
    final timeDate = Provider.of<TimeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("View All Rent Orders"),
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
      body: Consumer<GetRent>(builder: (context, rent, child) {
        if (rent.value?.isEmpty == true) {
          return Center(
              child: Container(
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                    "Empty",
                    style: TextStyle(fontSize: 20),
                  )));
        } else {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: rent.value?.length,
              itemBuilder: (BuildContext context, int index) {
                // DateTime from = DateTime.
                // String durationFrom = DateFormat('d MMM yyy').format((rent.value?[index].durationFrom).toString());
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(
                                10.0) //                 <--- border radius here
                            ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade200,
                            Colors.blue.shade500,
                            Colors.blue.shade900,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //     "Ordered By - ${(rent.value?[index].user?.name).toString()}"),
                                    // Text(
                                    //     "Order duration from - ${timeDate.getDate((rent.value?[index].durationFrom).toString())}"),
                                    // Text(
                                    //     "Order duration To - ${timeDate.getDate((rent.value?[index].durationTo).toString())}"),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                                10.0) //                 <--- border radius here
                                            ),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.blue.shade800,
                                            Colors.blue.shade900,
                                            Colors.blue.shade900,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Text(
                                        "Order By ${(rent.value?[index].user?.name).toString()}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 26,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      thickness: 1,
                                    ),
                                    Text(
                                      "Location",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      "Model Name - ${(rent.value?[index].rentItem?.name).toString()}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      "Price - ${(rent.value?[index].rentItem?.price).toString()}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      thickness: 2,
                                    ),
                                    const Text("Current address",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        )),

                                    Text(
                                      "Street Name - ${(rent.value?[index].pickingAddress?.address).toString()}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      "City - ${(rent.value?[index].pickingAddress?.city).toString()}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      "Country - ${(rent.value?[index].pickingAddress?.country).toString()}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      "Postal Code - ${(rent.value?[index].pickingAddress?.postalCode).toString()}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      thickness: 2,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                                10.0) //                 <--- border radius here
                                            ),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.blue.shade800,
                                            Colors.blue.shade900,
                                            Colors.blue.shade900,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            "Rent duration",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
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
                    ),
                  ),
                );
              });
        }
      }),
    );
  }
}
