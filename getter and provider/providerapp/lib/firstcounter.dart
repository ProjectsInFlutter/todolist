import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

class FirstCounter extends StatelessWidget {
  // final int count;
  // FirstCounter(this.count);

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context).getCounter;
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
                  Text('${(counter * 2)}',
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
