import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String username;
  final String profilePicUrl;
  final String photoUrl;

  ListItem({this.username, this.profilePicUrl, this.photoUrl});

  @override
  State<StatefulWidget> createState() => ListItemState();

}

class ListItemState extends State<ListItem> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child:
                  ClipOval(
                    child: Image.network(widget.profilePicUrl, width: 40.0, height: 40.0)
                  )
            ),
            Text(widget.username)
          ],
        ),
        GestureDetector(onDoubleTap: toggleLike, child: Image.network(widget.photoUrl)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                liked ? IconButton(icon: Icon(Icons.brightness_high, color: Colors.red), onPressed: toggleLike): IconButton(icon: Icon(Icons.brightness_low, color: Colors.black), onPressed: toggleLike),
                IconButton(icon: Icon(Icons.comment, color: Colors.black)),
                IconButton(icon: Icon(Icons.send, color: Colors.black)),
              ],
            ),
            IconButton(icon: Icon(Icons.save, color: Colors.black)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Align(alignment: Alignment.centerLeft, child: Text('4 likes')),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
          child: Align(alignment: Alignment.centerLeft, child: Text('there is a dog in the park and the dog likes to eat cake. the cake is only to be eaten by a certain type of dog, which is sorta crazy when you think about it')),
        )
      ],
    );
  }

  void toggleLike() {
    setState(() {
      liked = !liked;
    });
  }
}