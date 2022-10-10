import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getter/views/countergetx.dart';

import 'controller/controlercounter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Controll_Counter());
    return MaterialApp(
        theme:
            ThemeData(primaryColor: Colors.green, primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        home: GetBuilder<Controll_Counter>(
          builder: (_) => Countergetx(),
        ));
  }
}
