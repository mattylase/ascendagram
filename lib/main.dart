import 'package:ascendagram/completed/camera_screen.dart';
import 'package:ascendagram/completed/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Ascendagram',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFFFAFAFA),
        accentColor: Colors.black
      ),
      home: HomeScreen(),
      routes: <String, WidgetBuilder> {
        '/camera': (BuildContext context) => CameraScreen()
      },
    );
  }
}

