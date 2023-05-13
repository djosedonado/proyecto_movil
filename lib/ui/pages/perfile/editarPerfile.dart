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
  TextEditingController name= TextEditingController();
  TextEditingController surname= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();

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
        title: Text("Productos"),
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
                    height: 300,
                    child: _image != null
                        ? Image.file(File(_image.path))
                        : SizedBox(
                            width: 300,
                            height: 300,
                            child: Icon(
                              Icons.image,
                              size: 300,
                            ),
                          ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Campo Vacio";
                            }
                            if (value.length < 4 || value.length > 40) {
                              return "El campo Nombre debe tener entre 4 y 40 caracteres";
                            }
                            return null;
                          },
                          controller: name,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(Icons.article),
                              labelText: 'Nombre del Articulo',
                              border: const OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Campo Vacio";
                            }
                            if (value.length < 4 || value.length > 10) {
                              return "El campo debe tener entre 4 y 10 caracteres";
                            }
                            return null;
                          },
                          controller: surname,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              icon: Icon(Icons.code),
                              labelText: 'Codigo del Articulo',
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Campo Vacio";
                            }
                            if (value.length < 4 || value.length > 10) {
                              return "El campo debe tener entre 4 y 10 caracteres";
                            }
                            return null;
                          },
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: 'Unidades Entrante',
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Campo Vacio";
                            }
                            if (value.length < 4 || value.length > 10) {
                              return "El campo debe tener entre 4 y 10 caracteres";
                            }
                            return null;
                          },
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              icon: Icon(Icons.monetization_on),
                              labelText: 'Costo de la Mercancia',
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.2),
                          height: 45,
                          width: 200,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_keyFrom.currentState!.validate()) {
                                  print("exitoso");
                                } else {
                                  print("A ocurrido error");
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.add_box),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Agregar Articulo")
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      )),
    );
  }
}
