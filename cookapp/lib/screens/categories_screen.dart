import 'package:cookbookapp/screens/custom_drawer.dart';

import '../widgets/category_item.dart';
import 'package:flutter/material.dart';
import '/dummy_data.dart';

class CateroryScreen extends StatefulWidget {
  const CateroryScreen({Key? key}) : super(key: key);

  @override
  _CateroryScreenState createState() => _CateroryScreenState();
}

class _CateroryScreenState extends State<CateroryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Categories'),
      //   centerTitle: true,
      // ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (CatData) => Categoryitem(
                CatData.id,
                CatData.title,
                CatData.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
