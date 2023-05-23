import 'package:flutter/material.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';
import 'package:get/get.dart';
import 'package:proyecto_movil/ui/auth/textFormFile.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _keyFrom = GlobalKey<FormState>();
  ControllerUser controluser = Get.find();
  opreracionLogin(String e, String p) {
    print(e + " " + p);
    controluser.validarUser(e, p).then((value) {
      if (controluser.listaUserLogin!.isEmpty) {
        return Get.snackbar('Usuarios', 'Usuario no Encontrado',
            duration: const Duration(seconds: 3),
            icon: const Icon(Icons.info),
            shouldIconPulse: true,
            backgroundColor: Colors.blue[100]);
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
    controluser.verLocal();
    TextEditingController email =
        TextEditingController(text: controluser.emailLocal);
    TextEditingController password =
        TextEditingController(text: controluser.passwordLocal);
    return Scaffold(
        body: Stack(
      children: [
        //backgroundFondo(),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fondo3.png'), fit: BoxFit.cover)),
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _keyFrom,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormFile_Input(
                  texto: "Email",
                  controller: email,
                  colors: Colors.blue[100],
                  icono: Icon(
                    Icons.email,
                    color: Colors.blue[100],
                  ),
                  funcion: () {
                    if (_keyFrom.currentState!.validate()) {
                      opreracionLogin(email.text, password.text);
                    } else {
                      print("no se pudo carnal");
                    }
                  },
                ),
                SizedBox(height: 16.0),
                TextFormFile_Input(
                  controller: password,
                  pass: true,
                  texto: "Password",
                  colors: Colors.blue[100],
                  icono: Icon(
                    Icons.password_rounded,
                    color: Colors.blue[100],
                  ),
                  funcion: () {
                    if (_keyFrom.currentState!.validate()) {
                      opreracionLogin(email.text, password.text);
                    } else {
                      print("no se pudo carnal");
                    }
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 97, 117, 236))),
                  onPressed: () {
                    if (_keyFrom.currentState!.validate()) {
                      opreracionLogin(email.text, password.text);
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
    ));
  }
}

class backgroundFondo extends StatelessWidget {
  const backgroundFondo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      child: Image(image: AssetImage('assets/fondo3.png')),
    );
  }
}
