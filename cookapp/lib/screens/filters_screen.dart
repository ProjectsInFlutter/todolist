import 'package:cookbookapp/screens/custom_drawer.dart';
import 'package:flutter/material.dart';

class FlitersScreen extends StatefulWidget {
  static const routename = '/filters';
  final Function(Map<String, bool>) savefilters;
  final Map<String, bool> currentFulters;

  FlitersScreen(this.currentFulters, this.savefilters);

  @override
  _FlitersScreenState createState() => _FlitersScreenState();
}

class _FlitersScreenState extends State<FlitersScreen> {
  Widget bulidSwitchListTile(String title, bool currentvalue, String descrption,
      Function(bool) updatevalue) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      value: currentvalue,
      onChanged: updatevalue,
      subtitle: Text(
        descrption,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.green),
      ),
    );
  }

  dynamic _isGlutenFree = false;
  dynamic _isLactoseFree = false;
  dynamic _isVegan = false;
  dynamic _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFulters['GlutenFree'];
    _isLactoseFree = widget.currentFulters['LactoseFree'];
    _isVegan = widget.currentFulters['Vegan'];
    _isVegetarian = widget.currentFulters['Vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Filters'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              Map<String, bool> userfilters = {
                'GlutenFree': _isGlutenFree,
                'LactoseFree': _isLactoseFree,
                'Vegan': _isVegan,
                'Vegetarian': _isVegetarian,
              };
              widget.savefilters(userfilters);

              //Navigator.of(context).popAndPushNamed('/');
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 25,
            ),
            child: Text(
              'Select your meal filters',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.green),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              bulidSwitchListTile(
                  'isGlutenFree', _isGlutenFree, 'Is meal isGlutenFree',
                  (bool newvalue) {
                setState(() {
                  _isGlutenFree = newvalue;
                });
              }),
              bulidSwitchListTile(
                  'isLactoseFree', _isLactoseFree, 'Is meal isLactoseFree',
                  (bool newvalue) {
                setState(() {
                  _isLactoseFree = newvalue;
                });
              }),
              bulidSwitchListTile('isVegan', _isVegan, 'Is meal vegan?',
                  (bool newvalue) {
                setState(() {
                  _isVegan = newvalue;
                });
              }),
              bulidSwitchListTile(
                  'isVegetarian', _isVegetarian, 'Is meal Vegetarian?',
                  (bool newvalue) {
                setState(() {
                  _isVegetarian = newvalue;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
