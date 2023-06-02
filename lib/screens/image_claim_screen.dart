import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraExampleHome extends StatefulWidget {
  @override
  CameraExampleHomeState createState() => new CameraExampleHomeState();
}

class CameraExampleHomeState extends State<CameraExampleHome> {
  CameraController? _controller;
  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = new CameraController(firstCamera, ResolutionPreset.medium);
    await _controller?.initialize();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _initializeCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || _controller!.value.isInitialized == false) {
      return new Center(child: new CircularProgressIndicator());
    }

    return new AspectRatio(
      aspectRatio: _controller!.value.aspectRatio,
      child: new CameraPreview(_controller!),
    );
  }
}
