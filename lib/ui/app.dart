import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:proyecto_movil/ui/auth/login.dart';
import 'package:proyecto_movil/ui/pages/menu/menuAdmin.dart';

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
      },
    );
  }
}