import 'package:room_finder/admin/admin_home.dart';
import 'package:room_finder/services/add_product.dart';
import 'package:room_finder/services/update_product_api.dart';
import 'package:room_finder/utils/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UpdateProductUi extends StatefulWidget {
  final String id;
  final String name;
  final String brand;
  final String category;
  final String description;
  final String availableVehicle;
  final String price;
  final String image;
  UpdateProductUi(
      {Key? key,
      required this.id,
      required this.name,
      required this.brand,
      required this.category,
      required this.description,
      required this.availableVehicle,
      required this.price,
      required this.image})
      : super(key: key);

  @override
  State<UpdateProductUi> createState() => _UpdateProductUiState();
}

class _UpdateProductUiState extends State<UpdateProductUi> {
  // late File _image;
  // late File _image;
  bool apiCallProcess = false;
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController availableVehicle = TextEditingController();
  TextEditingController price = TextEditingController();
  SizedBox _gap() {
    return const SizedBox(
      height: 20,
    );
  }

  File? image;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Update Room"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 13, 78, 35),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              child: Form(
                key: globalFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.integration_instructions_outlined,
                      size: 80,
                      color: Color.fromARGB(255, 13, 78, 35),
                    ),
                    Text(
                      "Update below fields",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 13, 78, 35),
                      ),
                    ),

                    _gap(),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      // onSaved: (input) => email = input,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Please provide item name";
                        } else {
                          null;
                        }
                      },
                      controller: name,
                      decoration: InputDecoration(
                        labelText: "Loacation",
                        hintText: widget.name,
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: const OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.chair,
                          // color: Colors.black54,
                          color: Color.fromARGB(255, 13, 78, 35),
                          size: 30,
                        ),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      // onSaved: (input) => email = input,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Street";
                        } else {
                          null;
                        }
                      },
                      controller: brand,
                      decoration: InputDecoration(
                        labelText: "Street",
                        hintText: widget.brand,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.branding_watermark_outlined,
                          color: Color.fromARGB(255, 13, 78, 35),
                          size: 25,
                          // color: Colors.black54,
                        ),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      // onSaved: (input) => email = input,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Empty Category";
                        } else {
                          null;
                        }
                      },
                      controller: category,
                      decoration: InputDecoration(
                        labelText: "Floor",
                        hintText: widget.category,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.category_outlined,
                          color: Color.fromARGB(255, 13, 78, 35),
                          size: 30,
                        ),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      // onSaved: (input) => email = input,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Empty Description";
                        } else {
                          null;
                        }
                      },
                      controller: description,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: widget.description,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.description_outlined,
                          color: Color.fromARGB(255, 13, 78, 35),
                          size: 30,
                        ),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      // onSaved: (input) => email = input,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Please enter available vehicle";
                        } else {
                          null;
                        }
                      },
                      controller: availableVehicle,
                      decoration: InputDecoration(
                        labelText: "Total Available Room",
                        hintText: widget.availableVehicle,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.touch_app_outlined,
                          color: Color.fromARGB(255, 13, 78, 35),
                          size: 30,
                        ),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      // onSaved: (input) => email = input,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Please Provide Price";
                        } else {
                          null;
                        }
                      },
                      // onSaved: (input) => _value = num.tryParse(input),
                      controller: price,
                      decoration: InputDecoration(
                        labelText: "Price per month",
                        hintText: widget.price,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.attach_money_outlined,
                          color: Color.fromARGB(255, 13, 78, 35),
                          size: 30,
                        ),
                      ),
                    ),
                    // _gap(),
                    // ListTile(
                    //     leading: new Icon(Icons.photo_library),
                    //     title: new Text('Photo Library'),
                    //     onTap: () {
                    //       // Navigator.of(context).pop();
                    //     }),
                    _gap(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 13, 78, 35),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                Configs.mainURL + '/uploads/' + widget.image),
                          ),
                        ),
                      ),
                    ),

                    _gap(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 13, 78, 35),
                          shape: const StadiumBorder(),
                          fixedSize:
                              const Size(double.maxFinite, double.infinity),
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (apiCallProcess == false) {
                            if (validateAndSave()) {
                              setState(() {
                                apiCallProcess = true;
                              });
                            }
                            putproduct(
                              name.text,
                              brand.text,
                              category.text,
                              description.text,
                              availableVehicle.text,
                              price.text,
                              widget.image,
                              widget.id.toString(),
                              context,
                            ).then((value) => {
                                  setState(() {
                                    apiCallProcess = false;
                                  }),
                                  // if (value.isAdmin == false)
                                  // {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminHomePage()),
                                  ),
                                  Fluttertoast.showToast(
                                    msg:
                                        "Congratulations ! \n room has been updated",
                                    toastLength: Toast.LENGTH_SHORT,
                                    fontSize: 20.0,
                                    timeInSecForIosWeb: 1,
                                    textColor: Colors.white,
                                    backgroundColor:
                                        Color.fromARGB(255, 13, 78, 35),
                                  ),
                                });
                          }
                        },
                        child: apiCallProcess == true
                            ? const CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              )
                            : const Text(
                                "Update",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0,
                                ),
                              ),
                      ),
                    ),
                    _gap(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
