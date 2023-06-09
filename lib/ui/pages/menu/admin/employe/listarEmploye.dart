import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({super.key});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
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

  @override
  Widget build(BuildContext context) {
    ControllerUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Empleado"),
        actions: [
          IconButton(
            onPressed: () {
              controlu.listUsers();
              controlu.listarUser.refresh();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controlu.listaUserLogin!.length,
          itemBuilder: (BuildContext context, int index) {
             print("--->>>>" + controlu.listaUserLogin![index].foto);
            Uint8List bytes =
              base64Decode(controlu.listaUserLogin![index].foto);
           
            return Dismissible(
              key: Key(controlu.listaUserLogin![index].id.toString()),
              background: Container(
                color: Colors.red,
                alignment: AlignmentDirectional.centerEnd,
                child: const Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 48,
                ),
              ),
              onDismissed: (direction) {
                controlu
                    .eliminarUser(controlu.listaUserLogin![index].id.toString())
                    .then((value) {
                  Get.snackbar('Clientes', controlu.listaMensajes![0].mensaje,
                      duration: const Duration(seconds: 3),
                      icon: const Icon(Icons.info),
                      shouldIconPulse: true,
                      backgroundColor: Colors.white);
                });
              },
              child: controlu.listaUserLogin![index].rol == 1
                  ? ListTile(
                      leading: CircleAvatar(
                        child: controlu.listaUserLogin![index].foto == ""
                            ? Icon(Icons.person)
                            : SizedBox(
                                child: Image.memory(bytes),
                              ),
                      ),
                      title: Text(
                          "${controlu.listaUserLogin![index].Name}  ${controlu.listaUserLogin![index].surName}"),
                      subtitle: Text(
                          controlu.listaUserLogin![index].state.toString() ==
                                  "1"
                              ? "Activo"
                              : "Inactivo"),
                      trailing: IconButton(
                          onPressed: () {
                            controlu.listaUserLogin![0].index = index;
                            Get.toNamed("/editarEmpleado");
                            print(index);
                          },
                          icon: const Icon(
                              Icons.drive_file_rename_outline_outlined)))
                  : Text(""),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(controlu.listaUserLogin![0].foto);
          Get.toNamed("/registerEmploye");
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
