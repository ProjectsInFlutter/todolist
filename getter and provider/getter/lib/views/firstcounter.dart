import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getter/controller/controlercounter.dart';

//import 'counter.dart';

class FirstCounter extends StatelessWidget {
  // final int count;
  // FirstCounter(this.count);
  final Controll_Counter count1 = Get.find();

  @override
  Widget build(BuildContext context) {
    int c1 = count1.counter * 2;
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 150,
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text('Even Counter',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center)
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text('${(c1 + 2)}',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
