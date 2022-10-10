import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'counter.dart';
import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green, primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<Counter>(
          create: (ctx) => Counter(), child: CounterTest()),
    );
  }
}

class CounterTest extends StatefulWidget {
  const CounterTest({Key? key}) : super(key: key);

  @override
  _CounterTestState createState() => _CounterTestState();
}

class _CounterTestState extends State<CounterTest> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print('${counter++}');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'State Mangment',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: DashBoard(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<Counter>(context, listen: false).incrementCounter();
        },
      ),
    );
  }
}
