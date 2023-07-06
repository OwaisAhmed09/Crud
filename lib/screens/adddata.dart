import 'package:crudapi/controller/Controller.dart';
import 'package:crudapi/screens/list.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: name,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: email,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: username,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User Name',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: phone,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                addData({
                  'name': name.text,
                  'email': email.text,
                  'username': username.text,
                  'phone': phone.text
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home_Screen(),
                    ));
              },
              child: const Text("Add User"))
        ],
      ),
    );
  }
}
