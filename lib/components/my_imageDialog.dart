import 'package:flutter/material.dart';

class myImageDialog extends StatelessWidget {
  final Image image;
  const myImageDialog({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Image(
        image: image.image,
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.width * 0.9,
        fit: BoxFit.cover,
      ),
    );
  }
}
