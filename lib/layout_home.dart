// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'layout_groceries.dart';

class LayoutHome extends StatelessWidget {
  const LayoutHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 75,
        backgroundColor: const Color(0xff134DA5).withOpacity(0.93),
        leading: Row(
          children: [
            SizedBox(
              width: 3,
            ),
            Icon(
              Icons.location_pin,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Delhi",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Image.asset("Assets/Images/Account.png"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xff134DA5).withOpacity(0.93),
              ),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 347,
                    margin: EdgeInsets.only(
                      bottom: 15,
                      left: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
              height: 40,
            ),
            SizedBox(
              height: 390,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            Groceries()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 157,
                                width: 114,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(4, 4),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                    "Assets/welcomeScreens/Google.png"),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Restaurant",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 157,
                              width: 119,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(4, 4),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                  "Assets/welcomeScreens/Google.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Restaurant",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 157,
                              width: 114,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(4, 4),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                  "Assets/welcomeScreens/Google.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Grocery",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 157,
                              width: 114,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(4, 4),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                  "Assets/welcomeScreens/Google.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Stationary",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 157,
                              width: 119,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(4, 4),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                  "Assets/welcomeScreens/Google.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Laundry",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 157,
                              width: 114,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(4, 4),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                  "Assets/welcomeScreens/Google.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Restaurant",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 215,
              width: 414,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7,
                    offset: Offset(4, 4),
                  ),
                ],
                border: Border.all(
                  width: 1.65,
                  color: Colors.grey,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(height: 191, child: Image.asset("Assets/Images/holdOn.png")),
                          // SizedBox(
                          //   height: 7,
                          // ),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Top Picks For You",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 500,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 500,
                    child: Row(
                      children: [
                        Container(
                          height: 145,
                          width: 240,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(2, 4),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 145,
                          width: 240,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(2, 4),
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
            SizedBox(
              height: 20,
            ),
            Column(
              children: [

                Container(width: MediaQuery.of(context).size.width * 1.0, height: 250, child: Image.asset("Assets/Images/resume.png", fit: BoxFit.fill,)),


              ],
            ),

            Container(
              height: 82,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 242, 242, 242),
                border: Border.all(
                  width: 1.2,
                  color: Colors.grey,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Store",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Orders",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
