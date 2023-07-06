import 'package:crudapi/controller/Controller.dart';

import 'package:crudapi/screens/adddata.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddUserScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
          future: getUser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data.data[index].name),
                    subtitle: Text(snapshot.data.data[index].email),
                    trailing: Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              deleteUser(
                                  snapshot.data.data[index].id.toString());
                            },
                            icon: const Icon(Icons.delete)),
                        // GestureDetector(
                        //   child: IconButton(
                        //       onPressed: () {
                        //         Navigator.push(context, MaterialPageRoute(
                        //           builder: (context) {
                        //             return updateUser(
                        //               name: snapshot.data.data[index].name,
                        //               email: snapshot.data.data[index].email,
                        //               phone: snapshot.data.data[index].phone,
                        //               id: snapshot.data.data[index].id,
                        //             );
                        //           },
                        //         ));
                        //       },
                        //       icon: Icon(Icons.update)),
                        // ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // return Text(snapshot.data.toString());
          }),
    );
  }
}
