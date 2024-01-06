import 'dart:convert';

import 'package:api_example_70/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  UserDataModel? mData;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: mData != null && mData!.users!.isNotEmpty? ListView.builder(
        itemCount: mData!.users!.length,
          itemBuilder: (_, index){
          var eachUser = mData!.users![index];
            return ListTile(
              title: Text(eachUser.firstName!),
              subtitle: Text('${eachUser.company!.address!.coordinates!.lat}, ${eachUser.company!.address!.coordinates!.lng}'),
            );
          }
      ) : Container(
        child: Center(
          child: Text('No Users!!'),
        ),
      ),
    );
  }

  void getUsers() async {
    var uri = Uri.parse("https://dummyjson.com/users");
    var response = await httpClient.get(uri);

    print("Code: ${response.statusCode}");
    print("Response: ${response.body}");

    if (response.statusCode == 200) {
      var rawData = jsonDecode(response.body);
      mData = UserDataModel.fromJson(rawData);
      setState(() {});
    }
  }
}
