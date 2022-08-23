import 'package:room_finder/admin/product_details.dart';
import 'package:room_finder/model/product.dart';
import 'package:room_finder/services/searchProduct_api.dart';
import 'package:room_finder/utils/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ProductElement>? products;
  TextEditingController searchP = TextEditingController();
  String query = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<SearchProduct>(
          builder: (context, search, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextField(
                              controller: searchP,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: "Search . . .",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black54, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              search.getProduct(
                                searchP.text,
                                context,
                              );
                            },
                            icon: const Icon(Icons.search),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      if (search.value?.isEmpty == true) ...{
                        // search.getProduct(query, context),
                        Container(),
                      } else ...{
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: search.value?.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                              id: (search.value?[index].id)
                                                  .toString(),
                                              name: (search.value?[index].name)
                                                  .toString(),
                                              image:
                                                  (search.value?[index].image)
                                                      .toString(),
                                              brand:
                                                  (search.value?[index].brand)
                                                      .toString(),
                                              category: (search
                                                      .value?[index].category)
                                                  .toString(),
                                              price:
                                                  (search.value?[index].price)!
                                                      .toInt(),
                                              description: (search.value?[index]
                                                      .description)
                                                  .toString(),
                                              productid:
                                                  (search.value?[index].id)
                                                      .toString(),
                                              availableVehicle: ((search
                                                      .value?[index]
                                                      .availableVehicle)
                                                  .toString()),
                                            )),
                                  );
                                },
                                child: Column(
                                  children: [
                                    // const Divider(
                                    //   thickness: 1,
                                    //   color: Colors.black,
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7),
                                      child: ListTile(
                                        title: Text(
                                          (search.value?[index].name)
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromARGB(255, 13, 78, 35),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      }
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Widget searchProduct() => Search(
  //       text: query,
  //       hintText: "Search...",
  //       onChanged: product,
  //     );

  // Future product(String query) async {
  //   final products = await getProduct(query, context);
  //   if (!mounted) return;
  //   setState(() {
  //     this.query = query;
  //     this.products = products;
  //   });
  // }
}
