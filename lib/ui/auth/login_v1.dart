import 'package:flutter/material.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _keyFrom = GlobalKey<FormState>();
  ControllerUser controluser = Get.find();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  opreracionLogin(email, password) {
    controluser.validarUser(email, password).then((value) {
      if (controluser.listaUserLogin!.isEmpty) {
        return Get.snackbar('Usuarios', 'Usuario no Encontrado',
            duration: const Duration(seconds: 3),
            icon: const Icon(Icons.info),
            shouldIconPulse: true,
            backgroundColor: Colors.blue);
      } else {
        if (controluser.listaUserLogin![0].rol == 0) {
          return Get.toNamed("/menuAdmin");
        } else if (controluser.listaUserLogin![0].rol == 1) {
          return Get.toNamed("/menuBodega");
        } else {
          return Get.snackbar('Usuarios', 'Usuario no tiene rol',
              duration: const Duration(seconds: 3),
              icon: const Icon(Icons.info),
              shouldIconPulse: true,
              backgroundColor: Colors.blue);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /*
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Fondo_v1.png'), fit: BoxFit.cover),
        ),
        */
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _keyFrom,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'campo vacio';
                            }
                            if (value.isEmpty == value.isEmail) {
                              return "El campo no se lleno correctamente";
                            }
                            return null;
                          },
                          controller: _emailController,
                          onEditingComplete: () {
                            if (_keyFrom.currentState!.validate()) {
                              opreracionLogin(_emailController.text,
                                  _passwordController.text);
                            } else {
                              print("no se pudo carnal");
                            }
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'campo vacio';
                            }
                            if (value.length < 6 || value.length > 50) {
                              return "campo fuera de rango";
                            }
                            return null;
                          },
                          controller: _passwordController,
                          onEditingComplete: () {
                            if (_keyFrom.currentState!.validate()) {
                              opreracionLogin(_emailController.text,
                                  _passwordController.text);
                            } else {
                              print("no se pudo carnal");
                            }
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.password_outlined),
                            labelText: 'Password',
                            border: OutlineInputBorder()
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            if (_keyFrom.currentState!.validate()) {
                              opreracionLogin(_emailController.text,
                                  _passwordController.text);
                            } else {
                              print("no se pudo carnal");
                            }
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
