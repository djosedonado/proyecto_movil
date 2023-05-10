import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:proyecto_movil/ui/auth/login.dart';
import 'package:proyecto_movil/ui/pages/Inventario/addNewArticle.dart';
import 'package:proyecto_movil/ui/pages/Inventario/listInventario.dart';
import 'package:proyecto_movil/ui/pages/menu/admin/employe/editEmploye.dart';
import 'package:proyecto_movil/ui/pages/menu/admin/employe/listarEmploye.dart';
import 'package:proyecto_movil/ui/pages/menu/admin/menuAdmin.dart';
import 'package:proyecto_movil/ui/pages/menu/admin/employe/register.dart';
import 'package:proyecto_movil/ui/pages/menu/menuBodega.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PaintOut',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        "/login": (context) => const Login(),
        "/menuAdmin": (context) => const MenuAdmin(),
        "/menuBodega": (context) => const MenuBodega(),
        "/registerEmploye": (context) => const Register(),
        "/homeEmploye": (context) => const ListUsers(),
        "/listInventario": (context) => const ListInventario(),
        "/addNewArticle": (context) => const AddNewArticle(),
        "/editarEmpleado": (context) => const EditarUser(),
      },
    );
  }
}