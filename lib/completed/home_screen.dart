import 'dart:convert';

import 'package:ascendagram/completed/list_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Client httpClient;
  List<dynamic> users;
  List<dynamic> photos;

  HomeScreenState() {
    httpClient = Client();
  }

  @override
  void initState() {
    super.initState();

    httpClient
        .get('https://randomuser.me/api/?results=25&inc=name,picture')
        .then((response) => users = json.decode(response.body)['results'])
        .then((response) =>
            httpClient.get('https://jsonplaceholder.typicode.com/photos/'))
        .then((response) => photos = json.decode(response.body))
        .then((response) => Future.delayed(Duration(seconds: 2)))
        .then((value) => setState(() {}))
        .whenComplete(httpClient.close);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.camera), onPressed: () => Navigator.of(context).pushNamed('/camera')),
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset('assets/ascendagram.png',
              width: 100.0, fit: BoxFit.cover),
        ),
        titleSpacing: 0.0,
      ),
      body: getScreenBody(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.home, size: 40.0, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search, size: 40.0, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add, size: 40.0, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.child_care, size: 40.0, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.person, size: 40.0, color: Colors.black),
        ),
      ],),
    );
  }

  Widget getScreenBody() {
    if (users != null && photos != null) {
      return Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) => ListItem(
                    username:
                        '${users[index]['name']['title']} ${users[index]['name']['first']} ${users[index]['name']['last']} ',
                    profilePicUrl: users[index]['picture']['large'],
                photoUrl: photos[index]['url'],
                  ),
            ),
          )
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Expanded(child: Center(child: CircularProgressIndicator())),
        ],
      );
    }
  }
}
