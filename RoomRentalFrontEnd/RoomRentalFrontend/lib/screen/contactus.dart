import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 78, 35),
        title: const Text("Contact Us"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
            Divider(
              color: Color.fromARGB(255, 13, 78, 35),
              thickness: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "   Contact Us",
                    style: TextStyle(
                      color: Color.fromARGB(255, 13, 78, 35),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 13, 78, 35),
              thickness: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Rental  Private Limited",
                style: TextStyle(
                  color: Color.fromARGB(255, 13, 78, 35),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Address - Kathmandu, India",
                  style: TextStyle(
                    color: Color.fromARGB(255, 13, 78, 35),
                    fontSize: 18,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Call - 1448757475 / 098776321",
                  style: TextStyle(
                    color: Color.fromARGB(255, 13, 78, 35),
                    fontSize: 18,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Email - Rentalo@.com.np",
                  style: TextStyle(
                    color: Color.fromARGB(255, 13, 78, 35),
                    fontSize: 18,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Webiste - www.Rental.com",
                  style: TextStyle(
                    color: Color.fromARGB(255, 13, 78, 35),
                    fontSize: 18,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
