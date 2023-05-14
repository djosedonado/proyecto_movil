import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';

class MenuBodega extends StatelessWidget {
  const MenuBodega({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Bodega"),
      ),
      body: Center(
        child: Row(
          children: [
           Center(child:  Text("WELCOME ${controlu.listaUserLogin![0].Name}  ${controlu.listaUserLogin![0].surName}"),)
          ],
        ),
      ),
    );
  }
}
