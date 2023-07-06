import 'package:crudapi/controller/Controller.dart';
import 'package:crudapi/controller/data.dart';
import 'package:crudapi/screens/list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: ()async {
              getUser();
             await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home_Screen(),
                  ));
            },
            child: const Text("Get")),
      ),
    );
  }
}
