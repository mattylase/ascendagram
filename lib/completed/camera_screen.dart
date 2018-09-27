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

    availableCameras().then( (cameras) => _initializeCameraController(cameras[0]) );
  }

  void _initializeCameraController(CameraDescription camDesc) {
    _controller = CameraController(camDesc, ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller?.value == null) {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(child: Text('Getting camera info!', style: Theme.of(context).textTheme.title,)),
      );
    } else {
      return Container(
        child: Center(child: CameraPreview(_controller))
      );
    }
  }

}