import 'package:flutter/material.dart';

import 'firstcounter.dart';
import 'secondcounter.dart';

class DashBoard extends StatelessWidget {
  // final int count;
  // DashBoard(this.count);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Card(
            elevation: 10,
            child: SizedBox(
              height: 400,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Counters',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FirstCounter(),
                      SizedBox(
                        height: 30,
                      ),
                      SecondCounter(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
