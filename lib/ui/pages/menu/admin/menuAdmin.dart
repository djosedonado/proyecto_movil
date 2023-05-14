import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';
import 'package:proyecto_movil/ui/pages/menu.dart';

class MenuAdmin extends StatelessWidget {
  const MenuAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Administrador"),
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: 50, left: MediaQuery.of(context).size.width * 0.3),
        child: Text(
          "Hola " +
              controlu.listaUserLogin![0].Name +
              " " +
              controlu.listaUserLogin![0].surName,
          style: TextStyle(fontSize: 20),
        ),
      ),
      drawer: Menu(
        Name: controlu.listaUserLogin![0].Name,
        surName: controlu.listaUserLogin![0].surName,
        esAdmin: true,
      ),
    );
  }
}
