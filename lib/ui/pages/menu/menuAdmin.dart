import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';

class MenuAdmin extends StatelessWidget {
  const MenuAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Administrador"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.update))
        ]),
        body: Container(
          child: Text("Hola "+controlu.listUserAuth![0].Name),
        ),
    );
  }
}