// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getter/controller/controlercounter.dart';

class SecondCounter extends StatelessWidget {
  // final int count;
  // SecondCounter(this.count);
  final Controll_Counter count2 = Get.find();
  @override
  Widget build(BuildContext context) {
    int c2 = count2.counter;
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
                  Text('odd Counter',
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
                  Text('${(c2 * 2) + 1}',
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
