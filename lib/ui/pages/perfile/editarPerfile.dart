import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({super.key});

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  final _keyFrom = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  ImagePicker picker = ImagePicker();
  var _image;
  String? base64 = null;

  _galeria() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
      base64 = (_image != null)
          ? base64Encode(File(image!.path).readAsBytesSync())
          : null;
    });
  }

  _camara() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
      base64 = (_image != null)
          ? base64Encode(File(image!.path).readAsBytesSync())
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Form(
              key: _keyFrom,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: 250,
                    child: IconButton(
                      icon: _image != null
                          ? SizedBox(
                              width: 250,
                              height: 250,
                              child: CircleAvatar(
                                backgroundImage: FileImage(File(_image.path)),
                              ))
                          : SizedBox(
                              width: 250,
                              height: 250,
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.person,
                                  size: 240,
                                ),
                              ),
                            ),
                      onPressed: () {
                        _camara();
                      },
                    ),
                  ),
                ],
              )),
        ),
      )),
    );
  }
}
