import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  CameraController _controller;

  @override
  void initState() {
    super.initState();

    availableCameras().then(
            (cameras) =>
            setState(() {_controller = CameraController(cameras[0], ResolutionPreset.medium);})
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value == null) {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(child: Text('Getting camera information...')),
      );
    } else {
      return Container(
        decoration: BoxDecoration(color: Colors.green),
        child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
    child: new CameraPreview(_controller),
        )
      );
    }
  }

}