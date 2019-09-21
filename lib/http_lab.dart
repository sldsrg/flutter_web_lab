import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const url = "https://www.googleapis.com/books/v1/volumes?q={flutter}";

class HttpLabPage extends StatefulWidget {
  @override
  _HttpLabPageState createState() => _HttpLabPageState();
}

class _HttpLabPageState extends State<HttpLabPage> {
  List<String> books = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(books[index]),
            );
          },
        ),
      ),
    );
  }

  void getData() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        books = List<String>.from(jsonResponse['items']
            .map((item) => item['volumeInfo']['title'].toString()));
      });
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }
}
