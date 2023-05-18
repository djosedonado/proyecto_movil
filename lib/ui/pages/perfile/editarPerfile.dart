import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';
import 'package:proyecto_movil/ui/auth/textFormFile.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({super.key});

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  ControllerUser controlu = Get.find();
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

  eventoEditarPerfil(
      String Id, String Name, String surName, String Email, String Password) {
    controlu
        .editarUser(Id, Name, surName, Email, Password, '0', '1')
        .then((value) {
      return Get.snackbar('Clientes', controlu.listaMensajes![0].mensaje,
          duration: const Duration(seconds: 4),
          icon: const Icon(Icons.info),
          shouldIconPulse: true,
          backgroundColor: Color.fromARGB(255, 19, 58, 233));
    });
  }

  @override
  Widget build(BuildContext context) {
    name.text = controlu.listaUserLogin![0].Name;
    surname.text = controlu.listaUserLogin![0].surName;
    email.text = controlu.listaUserLogin![0].email;

    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        contentPadding: EdgeInsets.all(10),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              TextFormFile_Input(
                                texto: "Password",
                                colors: Colors.black,
                                icono: Icon(
                                  Icons.key,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormFile_Input(
                                texto: "Password",
                                colors: Colors.black,
                                icono: Icon(
                                  Icons.key,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Cambiar Password",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)))
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: Icon(Icons.key))
        ],
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
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormFile_Input(
                      controller: name,
                      texto: "Nombre",
                      colors: Colors.black,
                      icono: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      funcion: () {
                        if (_keyFrom.currentState!.validate()) {
                          eventoEditarPerfil(
                              controlu.listaUserLogin![0].id.toString(),
                              name.text,
                              surname.text,
                              email.text,
                              password.text);
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormFile_Input(
                      controller: surname,
                      texto: "Apellido",
                      colors: Colors.black,
                      icono: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      funcion: () {
                        if (_keyFrom.currentState!.validate()) {
                          eventoEditarPerfil(
                              controlu.listaUserLogin![0].id.toString(),
                              name.text,
                              surname.text,
                              email.text,
                              password.text);
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormFile_Input(
                      controller: email,
                      texto: "Email",
                      editable: false,
                      colors: Colors.black,
                      icono: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      funcion: () {
                        if (_keyFrom.currentState!.validate()) {
                          eventoEditarPerfil(
                              controlu.listaUserLogin![0].id.toString(),
                              name.text,
                              surname.text,
                              email.text,
                              password.text);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.70,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_keyFrom.currentState!.validate()) {
                              eventoEditarPerfil(
                                  controlu.listaUserLogin![0].id.toString(),
                                  name.text,
                                  surname.text,
                                  email.text,
                                  password.text);
                            }
                          },
                          child: Icon(Icons.account_circle))),
                ],
              )),
        ),
      )),
    );
  }
}
