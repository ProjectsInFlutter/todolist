import 'package:flutter/material.dart';

import 'filters_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  Widget bulidedListItem(String title, IconData icon, VoidCallback topHandler) {
    return ListTile(
      onTap: topHandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(25),
            height: 80,
            width: double.infinity,
            margin: EdgeInsets.only(top: 15),
            color: Colors.green,
            child: Text(
              'Main Menu',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          bulidedListItem('Categories', Icons.category, () {
            Navigator.of(context).popAndPushNamed('/');
          }),
          bulidedListItem('Filters', Icons.filter_tilt_shift, () {
            Navigator.of(context).popAndPushNamed(FlitersScreen.routename);
          }),
          bulidedListItem('Meals', Icons.restaurant, () {}),
        ],
      ),
    );
  }
}
