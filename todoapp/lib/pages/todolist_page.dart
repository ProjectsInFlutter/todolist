import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoList_Page extends StatefulWidget {
  const ToDoList_Page({Key? key}) : super(key: key);

  @override
  _ToDoList_PageState createState() => _ToDoList_PageState();
}

class _ToDoList_PageState extends State<ToDoList_Page> {
  void initfirestore() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    await Firebase.initializeApp();
  }

  late String NewTask;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(Icons.home),
        ),
        backgroundColor: Colors.green[200],
        title: Text(
          'My List',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('TodoList').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Text('no text yet');

            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                      key: Key(snapshot.data!.docs[index].id),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            snapshot.data!.docs[index].get('NewTask'),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('TodoList')
                                    .doc(snapshot.data!.docs[index].id)
                                    .delete();
                              },
                              icon: Icon(
                                Icons.clear,
                                color: Colors.green[200],
                              )),
                        ),
                      ),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.startToEnd) {
                          FirebaseFirestore.instance
                              .collection('TodoList')
                              .doc(snapshot.data!.docs[index].id)
                              .delete();
                        }
                      });
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('New Task'),
                  content: TextField(
                    onChanged: (String value) {
                      NewTask = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 238, 201, 145)),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('TodoList')
                              .add({'NewTask': NewTask});
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Add',
                        )),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 238, 201, 145)),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: Text('cancel'),
                    )
                  ],
                );
              });
        },
        backgroundColor: Colors.green[200],
        child: Icon(Icons.add),
      ),
    );
  }
}
