import 'dart:ui_web';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //! Variables
  var num = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Flutter App"),
          backgroundColor: Colors.blue[200],
        ),

        body: Column(
          mainAxisAlignment: num == 0
              ? MainAxisAlignment.start
              : num == 1
              ? MainAxisAlignment.center
              : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: num == 0
                  ? MainAxisAlignment.start
                  : num == 1
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (num == 2) {
                        num = 0;
                      } else  
                      num = num + 1;
                    });
                  },
                  child: Text("Dont Press Me"),
                ),
              ],
            ),
          ],
        ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.blue[200],
          child: IconButton(icon: Icon(Icons.home), onPressed: () {}),
        ),
      ),
    );
  }
}
