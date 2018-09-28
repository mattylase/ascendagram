import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  String profilePicUrl;
  String name;

  ListItem({this.profilePicUrl, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ClipOval(child: Image.network(profilePicUrl, width: 40.0, height: 40.0,))),
            Text(name)
          ],
        ),

      ],
    );
  }

}