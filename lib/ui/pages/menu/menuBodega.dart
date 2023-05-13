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
      drawer: Drawer(
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
                Get.back();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
