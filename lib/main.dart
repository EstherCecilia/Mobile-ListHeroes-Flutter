import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/home_page.dart';
import 'package:http/http.dart' as http;


getAvenger() async {
  var url = Uri.parse('https://akabab.github.io/superhero-api/api/all.json');
  http.Response response = await http.get(url);
  try {
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}
void main() async{
  List avengers = await getAvenger();
  runApp(MyApp(avengers: avengers));
}

class MyApp extends StatelessWidget {
  final List avengers;

  const MyApp({required this.avengers});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(avengers:avengers),
    );
  }
}
