// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/cubit/claim_cubit/claim_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../themes/app_theme.dart';

/// Camera example home widget.
class MyImageClaimScreen extends StatefulWidget {
  /// Default Constructor
  const MyImageClaimScreen({super.key});

  @override
  State<MyImageClaimScreen> createState() {
    return _MyImageClaimScreenState();
  }
}

class _MyImageClaimScreenState extends State<MyImageClaimScreen> {
  File? file;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        text: "Imagen Reclamo",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 140,
                width: 180,
                color: Colors.black12,
                child: file == null
                    ? Icon(
                        Icons.image,
                        size: 50,
                      )
                    : Image.file(
                        file!,
                        fit: BoxFit.fill,
                      ),
              ),
              MyButton(
                fontSize: 15,
                width: 235,
                height: 50,
                textColor: Colors.white,
                color: AppTheme.secondary,
                text: "Galeria",
                onPressed: (){
                  getgall();
                },
              ),
              MyButton(
                fontSize: 15,
                width: 235,
                height: 50,
                textColor: Colors.white,
                color: AppTheme.secondary,
                text: "Camara",
                onPressed: (){
                  getcam();

                },
              ),

              MyButton(
                fontSize: 15,
                width: 235,
                height: 50,
                textColor: Colors.white,
                color: AppTheme.primary,
                text: "Enviar",
                onPressed: (){
                  BlocProvider.of<ClaimCubit>(context).setImage(file!);
                  Navigator.pop(context);
                },
              ),
              Row(
                children: [
                  MyButton(
                    fontSize: 15,
                    width: 100,
                    height: 50,
                    textColor: Colors.white,
                    color: AppTheme.alert,
                    text: "Cancelar",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  MyButton(
                    fontSize: 15,
                    width: 100,
                    height: 50,
                    textColor: Colors.white,
                    color: AppTheme.primary,
                    text: "Enviar",
                    onPressed: () {
                      //cubit enviar
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  getcam() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgall() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}
