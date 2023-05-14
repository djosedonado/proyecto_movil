import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';

class Menu extends StatelessWidget {
  final String? Name;
  final String? surName;
  final bool? esAdmin;
  const Menu({Key? key, this.Name, this.surName, this.esAdmin = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  Name! + " " + surName!,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          esAdmin == true ? Admin(): ProductosInventario(),
        ],
      ),
    );
  }
}

class ProductosInventario extends StatelessWidget {
  const ProductosInventario({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          title: Text('Perfil'),
          onTap: () {
            // Acción que se ejecuta al presionar la opción
            Get.toNamed("/perfileUser");
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
    );
  }
}

class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerUser controlu = Get.find();
    return Column(
      children: [
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
          title: Text('Perfil'),
          onTap: () {
            // Acción que se ejecuta al presionar la opción
            Get.toNamed("/perfileUser");
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
    );
  }
}