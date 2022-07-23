// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Groceries extends StatelessWidget {
  const Groceries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Grocery",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 347,
                  margin: const EdgeInsets.only(
                    bottom: 15,
                    left: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffC4C4C4).withOpacity(.30),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 3),
                      SizedBox(
                        width: 30,
                        child: Icon(
                          Icons.search,
                          color: Colors.grey.withOpacity(.50),
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search for Store",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 104,
                  width: 107,
                  color: Color(0xffD9D9D9),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "supermart",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tagore  Area",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Offer",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 60,
                ),
                Text(
                  "Open",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4CAF50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
