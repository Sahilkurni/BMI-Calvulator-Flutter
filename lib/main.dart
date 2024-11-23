import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyhomePagestate();
  }
}

class MyhomePagestate extends State<MyHomePage> {
  var weightcontoller = TextEditingController();
  var heightcontroller = TextEditingController();
  double ans = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: weightcontoller,
              decoration: const InputDecoration(hintText: "your weight in kgs"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: heightcontroller,
              decoration: const InputDecoration(hintText: 'your height in cm'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                var weight = int.parse(weightcontoller.text.toString());
                var height = int.parse(heightcontroller.text.toString());
                var heightmts = height / 100;
                var bmi = weight / (pow(heightmts, 2));
                setState(() {
                  ans = bmi;
                });
              },
              child: const Text(
                "Calculate BMI",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Text("your BMI is $ans")
        ],
      ),
    );
  }
}
