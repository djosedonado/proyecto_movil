import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerUser controuser = Get.find();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color.fromARGB(255, 254, 74, 64),
            Color.fromARGB(255, 1, 128, 159)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.2, top: 80),
              child: Column(
                children: [
                  Text(
                    "PaintOut",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Text(
                    "hola como estas",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              )),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(children: [
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          controuser
                              .validarUser(email.text, password.text)
                              .then((value) {
                            if (controuser.listaUserLogin!.isEmpty) {
                              Get.snackbar('Usuarios', 'Usuario no Encontrado',
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor: Colors.blue);
                            } else {
                              if (controuser.listaUserLogin![0].rol == 0) {
                                Get.toNamed("/menuAdmin");
                              } else if (controuser.listaUserLogin![0].rol ==
                                  1) {
                                Get.toNamed("/menuBodega");
                              } else {
                                Get.snackbar('Usuarios', 'Usuario no tiene rol',
                                    duration: const Duration(seconds: 3),
                                    icon: const Icon(Icons.info),
                                    shouldIconPulse: true,
                                    backgroundColor: Colors.blue);
                              }
                              /*
                              controla
                                  .listArticlesId(
                                      controlu.listaUserLogin![0].id.toString())
                                  .then(
                                      (value) => Get.toNamed("/listarticles"));
                                      */
                            }
                          });
                        },
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
