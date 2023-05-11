import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/controlle/controllerArticle.dart';
import '../../../domain/controlle/controllerUser.dart';

class AddNewArticle_V1 extends StatefulWidget {
  const AddNewArticle_V1({super.key});

  @override
  State<AddNewArticle_V1> createState() => _AddNewArticle_V1State();
}

class _AddNewArticle_V1State extends State<AddNewArticle_V1> {
  final _keyFrom = GlobalKey<FormState>();
  ControllerArticle controla = Get.find();
  ControllerUser controlu = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController codigo = TextEditingController();
  TextEditingController unidad = TextEditingController();
  TextEditingController valor = TextEditingController();

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

  operacionCrearArticulo(String name, String codigo, String unidad, String id,
      String valor, String base) {
    print(base);
    if (base == "null") {
      return Get.snackbar('Articulos', "Imagen no Seleccionada",
          duration: const Duration(seconds: 3),
          icon: const Icon(Icons.info),
          shouldIconPulse: true,
          backgroundColor: Colors.blue);
    } else {
      return controla
          .addNewArticles(name, codigo, unidad, id, valor, base)
          .then((value) {
        return Get.snackbar('Articulos', controla.listaMensajes![0].mensaje,
            duration: const Duration(seconds: 3),
            icon: const Icon(Icons.info),
            shouldIconPulse: true,
            backgroundColor: Colors.blue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
        actions: [
          IconButton(
              onPressed: () {
                _camara();
              },
              icon: Icon(Icons.camera)),
          IconButton(
              onPressed: () {
                _galeria();
              },
              icon: Icon(Icons.image))
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
                          controller: codigo,
                          keyboardType: TextInputType.number,
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
                          controller: unidad,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              icon: Icon(Icons.numbers),
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
                          controller: valor,
                          keyboardType: TextInputType.number,
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
                                  operacionCrearArticulo(
                                      name.text,
                                      codigo.text,
                                      unidad.text,
                                      controlu.listaUserLogin![0].id.toString(),
                                      valor.text,
                                      base64.toString());
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
