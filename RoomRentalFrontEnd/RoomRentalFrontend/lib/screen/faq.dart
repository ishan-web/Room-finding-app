import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 78, 35),
        title: const Text("FAQs"),
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
                  image: AssetImage('assets/images/faq.png'),
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
                    "   Frequently Asked Questions",
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
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Text(
                "1. How can I search room in this app? \n- You can search room in our search page.",
                style: TextStyle(
                    color: Color.fromARGB(255, 13, 78, 35),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Text(
                "2. What is the service timing?\n - We facilitate our services from 8 am in the morning to 8 pm",
                style: TextStyle(
                    color: Color.fromARGB(255, 13, 78, 35),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Text(
                "3. How can I pay for the services? \n- Currently there are no online payment so you can pay while shifting.",
                style: TextStyle(
                    color: Color.fromARGB(255, 13, 78, 35),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Text(
                "4. Can I cancel? \n-We make sure that user are given top priority and can se cancelled any time   .",
                style: TextStyle(
                    color: Color.fromARGB(255, 13, 78, 35),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
