import 'dart:convert';

import 'package:api_example_70/data_model.dart';
import 'package:api_example_70/product_page.dart';
import 'package:api_example_70/users_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
DataModel? mData;
  @override
  void initState() {
    super.initState();
    getQuotes();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
      ),
      body: mData != null && mData!.quotes.isNotEmpty ?
      ListView.builder(
        itemCount: mData!.quotes.length,
          itemBuilder: (_, index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 7,
            child: ListTile(
              title: Text('${mData!.quotes[index].quote}'),
              subtitle: Text('${mData!.quotes[index].author}'),
            ),
          ),
        );
      })
          : Container(
        child: Center(
          child: Text('No Quotes yet!!'),
        ),
      ),
    );
  }
  
  void getQuotes() async{
    var uri = Uri.parse("https://dummyjson.com/quotes");
    var response = await httpClient.get(uri);

    print("Code: ${response.statusCode}");
    print("Response: ${response.body}");

    if(response.statusCode==200){
      var rawData = jsonDecode(response.body);
      mData = DataModel.fromJson(rawData);
      setState(() {

      });
    }
  }
}


