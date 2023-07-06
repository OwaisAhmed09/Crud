import 'package:crudapi/controller/Controller.dart';
import 'package:crudapi/screens/list.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  final name;
  final email;
  final username;
  final phone;
  final id;
  const UpdatePage({
    Key? key,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.id
  }) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController nameControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  TextEditingController usernameControl = TextEditingController();
  TextEditingController phoneControl = TextEditingController();
  @override
  void initState() {
    // TODO: implement
    nameControl.text = "${widget.name}";
    usernameControl.text = "${widget.username}";
    emailControl.text = "${widget.email}";
    phoneControl.text = "${widget.phone}";

    super.initState();
  }

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
            controller: nameControl,
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
            controller: emailControl,
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
            controller: usernameControl,
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
            controller: phoneControl,
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
              onPressed: () async {
                await updateUser(
                  {
                    'name': nameControl.text,
                    'email': emailControl.text,
                    'username': usernameControl.text,
                    'phone': phoneControl.text,
                  },
                  widget.id,
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  Home_Screen(),
                    ));
              },
              child: const Text("Update"))
        ],
      ),
    );
  }
}
