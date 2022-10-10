import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getter/controller/controlercounter.dart';

import 'dashboard.dart';

class Countergetx extends StatelessWidget {
  Countergetx({Key? key}) : super(key: key);
  // final Controll_Counter counter = Get.find();
  final controller = Get.put(Controll_Counter());
  int u = 0;

  @override
  Widget build(BuildContext context) {
    print('${u++}');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'State getx mangment Mangment',
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
          controller.incrementCounter();
        },
      ),
    );
  }
}
