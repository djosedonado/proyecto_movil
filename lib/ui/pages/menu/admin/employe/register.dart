import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../domain/controlle/controllerUser.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _keyFrom = GlobalKey<FormState>();
  ControllerUser controlu = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Empleado"),
      ),
      body: SafeArea(
        child: Container(
          child: Form(
            key: _keyFrom,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "campos vacios";
                          }
                          if (value.length < 6 || value.length > 20) {
                            return "rango 3 hasta 20";
                          }
                          return null;
                        },
                        controller: name,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Nombre",
                            border: const OutlineInputBorder(),
                            isDense: false),
                        onEditingComplete: () {
                          if (_keyFrom.currentState!.validate()) {
                            controlu
                                .crearUser(name.text, surname.text, email.text,
                                    password.text, "1", "1")
                                .then((value) {
                              Get.snackbar('Usuario',
                                  controlu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor:
                                      Color.fromARGB(255, 19, 58, 233));
                            });
                            controlu.listUsers();
                            controlu.listarUser.refresh();
                          }else{

                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "campos vacios";
                          }
                          if (value.length < 6 || value.length > 20) {
                            return "rango 3 hasta 20";
                          }
                          return null;
                        },
                        controller: surname,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Apellido",
                            border: const OutlineInputBorder(),
                            isDense: false),
                        onEditingComplete: () {
                          if (_keyFrom.currentState!.validate()) {
                            controlu
                                .crearUser(name.text, surname.text, email.text,
                                    password.text, "1", "1")
                                .then((value) {
                              Get.snackbar('Usuario',
                                  controlu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor:
                                      Color.fromARGB(255, 19, 58, 233));
                            });
                            controlu.listUsers();
                            controlu.listarUser.refresh();
                          } else {
                            print("no se pudo carnal");
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty == value.isEmail) {
                            return " No valido";
                          }
                          if (value.length < 1 || value.length > 20) {
                            return "rango 1 hasta 20";
                          }
                          return null;
                        },
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: "Email",
                            border: const OutlineInputBorder(),
                            isDense: false,
                            contentPadding: EdgeInsets.all(20)),
                        onEditingComplete: () {
                          if (_keyFrom.currentState!.validate()) {
                            controlu
                                .crearUser(name.text, surname.text, email.text,
                                    password.text, "1", "1")
                                .then((value) {
                              Get.snackbar('Usuario',
                                  controlu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor:
                                      Color.fromARGB(255, 19, 58, 233));
                            });
                            controlu.listUsers();
                            controlu.listarUser.refresh();
                          } else {
                            print("no se pudo carnal");
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "campos vacios";
                          }
                          if (value.length < 1 || value.length > 20) {
                            return "rango 1 hasta 20";
                          }
                          return null;
                        },
                        controller: password,
                        decoration: InputDecoration(
                            icon: Icon(Icons.password),
                            labelText: "Password",
                            border: const OutlineInputBorder(),
                            isDense: false),
                        onEditingComplete: () {
                          if (_keyFrom.currentState!.validate()) {
                            controlu
                                .crearUser(name.text, surname.text, email.text,
                                    password.text, "1", "1")
                                .then((value) {
                              Get.snackbar('Usuario',
                                  controlu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor:
                                      Color.fromARGB(255, 19, 58, 233));
                            });
                            controlu.listUsers();
                            controlu.listarUser.refresh();
                          } else {
                            print("no se pudo carnal");
                          }
                        },
                        obscureText: true,
                      ),
                      Container(
                        child: ElevatedButton(
                          child: Icon(Icons.app_registration),
                          onPressed: () {
                            if (_keyFrom.currentState!.validate()) {
                              controlu
                                .crearUser(name.text, surname.text, email.text,
                                    password.text, "1", "1")
                                .then((value) {
                              Get.snackbar('Usuario',
                                  controlu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor:
                                      Color.fromARGB(255, 19, 58, 233));
                            });
                            controlu.listUsers();
                            controlu.listarUser.refresh();
                            } else {
                              print("no se pudo carnal");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

                            */
