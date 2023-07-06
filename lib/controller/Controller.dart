import 'dart:convert';

import 'package:crudapi/controller/data.dart';
import 'package:http/http.dart' as http;

Future getUser() async {
  const url = "https://maaz-api.tga-edu.com/api/users";
  var baseUrl = Uri.parse(url);
  var response = await http.get(baseUrl);
  var jsonRes = jsonDecode(response.body);
  var userData = Crudapi.fromJson(jsonRes);
  // print(userData.data![0].name);
  return userData;
}

addData(data) async {
  const url = "https://maaz-api.tga-edu.com/api/users";
  var baseUrl = Uri.parse(url);
  final response = await http.post(baseUrl,
      body: jsonEncode(data), headers: {'content-type': 'application/json'});
  print(response.body);
}

deleteUser(id) async {
  var url = "https://maaz-api.tga-edu.com/api/users/$id";
  Uri uri = Uri.parse(url);
  final response = await http.delete(uri);
  print(response.body);
}

getById(id) async {
  var url = "https://maaz-api.tga-edu.com/api/users/$id";
  var baseURL = Uri.parse(url);
  var response = await http.get(baseURL);
  var responseData = jsonDecode(response.body);
  var userData = Crudapi.fromJson(responseData);
  print(userData.data);
  return userData;
}


updateUser(id, data,) async {
  var url = "https://maaz-api.tga-edu.com/api/users/$id";
  var baseURL = Uri.parse(url);
  final response = await http.put(baseURL,
      body: jsonEncode(data), headers: {'content-type': 'application/json'});
  print(response.body);
  if (response.statusCode == 200) {
    print("app is not working");
  }
}
