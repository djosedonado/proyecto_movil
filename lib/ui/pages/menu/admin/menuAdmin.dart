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
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Text(
                    'Menú',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                  Text(
                    controlu.listaUserLogin![0].Name +
                        " " +
                        controlu.listaUserLogin![0].surName,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Empleados'),
              onTap: () {
                controlu.listUsers();
                controlu.listarUser.refresh();
                Get.toNamed("/homeEmploye");
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('PRODUCTO'),
              onTap: () {
                Get.toNamed(
                    "/addNewArticle"); // Acción que se ejecuta al presionar la opción
              },
            ),
            ListTile(
              leading: Icon(Icons.fact_check),
              title: Text('INVENTARIO'),
              onTap: () {
                Get.toNamed(
                    "/listInventario"); // Acción que se ejecuta al presionar la opción
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('ESTADISTICAS'),
              onTap: () {
                // Acción que se ejecuta al presionar la opción
              },
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('CERRAR SESSION'),
              onTap: () {
                Get.toNamed("/login");
              },
            ),
          ],
        ),
      ),
    );
  }
}
