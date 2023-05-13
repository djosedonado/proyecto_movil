import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/controlle/controllerUser.dart';

class EditarUser extends StatefulWidget {
  const EditarUser({super.key});

  @override
  State<EditarUser> createState() => _EditarUserState();
}

class _EditarUserState extends State<EditarUser> {
  final _keyFrom = GlobalKey<FormState>();
  ControllerUser controlu = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    name.text =
        controlu.listaUserLogin![controlu.listaUserLogin![0].index].Name;
    surname.text =
        controlu.listaUserLogin![controlu.listaUserLogin![0].index].surName;
    email.text =
        controlu.listaUserLogin![controlu.listaUserLogin![0].index].email;
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
                              Get.snackbar('Clientes',
                                  controlu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor:
                                      Color.fromARGB(255, 19, 58, 233));
                            });
                          } else {}
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
                                .editarUser(
                                    controlu
                                        .listaUserLogin![
                                            controlu.listaUserLogin![0].index]
                                        .id
                                        .toString(),
                                    name.text,
                                    surname.text,
                                    email.text,
                                    password.text,
                                    1.toString(),
                                    1.toString())
                                .then((value) {
                              Get.snackbar('Clientes',
                                  controlu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor: Colors.blue);
                            });
                            controlu.listUsers();
                            controlu.listarUser.refresh();
                            Get.back();
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
                                .editarUser(
                                    controlu
                                        .listaUserLogin![
                                            controlu.listaUserLogin![0].index]
                                        .id
                                        .toString(),
                                    name.text,
                                    surname.text,
                                    email.text,
                                    password.text,
                                    1.toString(),
                                    1.toString())
                                .then((value) {
                              Get.snackbar('Clientes',
                                  controlu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor: Colors.blue);
                            });
                            controlu.listUsers();
                            controlu.listarUser.refresh();
                            Get.back();
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
                                .editarUser(
                                    controlu
                                        .listaUserLogin![
                                            controlu.listaUserLogin![0].index]
                                        .id
                                        .toString(),
                                    name.text,
                                    surname.text,
                                    email.text,
                                    password.text,
                                    1.toString(),
                                    1.toString())
                                .then((value) {
                              Get.snackbar('Clientes',
                                  controlu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor: Colors.blue);
                            });
                            controlu.listUsers();
                            controlu.listarUser.refresh();
                            Get.back();
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
                                  .editarUser(
                                      controlu
                                          .listaUserLogin![
                                              controlu.listaUserLogin![0].index]
                                          .id
                                          .toString(),
                                      name.text,
                                      surname.text,
                                      email.text,
                                      password.text,
                                      1.toString(),
                                      1.toString())
                                  .then((value) {
                                Get.snackbar('Clientes',
                                    controlu.listaMensajes![0].mensaje,
                                    duration: const Duration(seconds: 3),
                                    icon: const Icon(Icons.info),
                                    shouldIconPulse: true,
                                    backgroundColor: Colors.blue);
                              });
                              controlu.listUsers();
                              controlu.listarUser.refresh();
                              Get.back();
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
controlu
                                .editarUser(
                                    controlu
                                        .listaUserLogin![
                                            controlu.listaUserLogin![0].index]
                                        .id
                                        .toString(),
                                    name.text,
                                    surname.text,
                                    email.text,
                                    password.text,
                                    1.toString(),
                                    1.toString())
                                .then((value) {
                              Get.snackbar('Clientes',
                                  controlu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor: Colors.yellow);
                            });
                            controlu.listUsers();
                            controlu.listarUser.refresh();
                            Get.back();

 */