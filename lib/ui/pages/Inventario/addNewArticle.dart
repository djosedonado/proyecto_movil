import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_movil/domain/controlle/controllerArticle.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';

class AddNewArticle extends StatefulWidget {
  const AddNewArticle({super.key});

  @override
  State<AddNewArticle> createState() => _AddNewArticleState();
}

class _AddNewArticleState extends State<AddNewArticle> {
  XFile? _pickedFile;
  final ImagePicker _picker = ImagePicker();
  String? base64String= null;

  Future<void> _takePictureGalleryBanner(int opcion) async {
    if (opcion == 1) {
      final _pickedImage = await _picker.pickImage(source: ImageSource.camera);

      if (_pickedImage != null) {
        setState(() {
          _pickedFile = _pickedImage;
        });

        List<int> imageBytes = File(_pickedFile!.path).readAsBytesSync();
        base64String = base64Encode(imageBytes);
        debugPrint(base64String);
      } else {

        print("no a seleccionado una img");
      }
    } else {
      final _pickedImage = await _picker.pickImage(source: ImageSource.gallery);

      if (_pickedImage != null) {
        setState(() {
          _pickedFile = _pickedImage;
        });

        List<int> imageBytes = File(_pickedFile!.path).readAsBytesSync();
        base64String = base64Encode(imageBytes);
        debugPrint(base64String);
      } else {
        print("no a seleccionado una img");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ControllerArticle controla = Get.find();
    ControllerUser controlu = Get.find();
    TextEditingController name = TextEditingController();
    TextEditingController codigo = TextEditingController();
    TextEditingController unidad = TextEditingController();
    TextEditingController valor = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Articulos"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                _takePictureGalleryBanner(1);
              },
              icon: Icon(Icons.camera_alt)),
          IconButton(
            onPressed: () {
              _takePictureGalleryBanner(2);
            },
            icon: Icon(Icons.image),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                right: 35,
                left: 35,
                top: MediaQuery.of(context).size.height * 0.27),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              _pickedFile == null
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 300,
                      width: 200,
                      child: Image.file(File(_pickedFile!.path)),
                    ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 12, 11, 11)),
                  ),
                  hintText: 'Nombre',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: codigo,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 12, 11, 11)),
                  ),
                  hintText: 'codigo',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: valor,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 12, 11, 11)),
                  ),
                  hintText: 'valor',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: unidad,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 12, 11, 11)),
                  ),
                  hintText: 'unidad',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  'Agregar',
                  style: TextStyle(
                    color: Color.fromARGB(255, 14, 13, 13),
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xff4c505b),
                  child: IconButton(
                    color: const Color.fromARGB(255, 7, 6, 6),
                    onPressed: () {
                      if (base64String == null) {
                        Get.snackbar(
                            'Articulos', "Imagen no Seleccionada",
                            duration: const Duration(seconds: 3),
                            icon: const Icon(Icons.info),
                            shouldIconPulse: true,
                            backgroundColor: Colors.blue);
                      } else {
                        controla
                            .addNewArticles(
                                name.text,
                                codigo.text,
                                unidad.text,
                                controlu.listaUserLogin![0].id.toString(),
                                valor.text,
                                base64String.toString())
                            .then((value) {
                          Get.snackbar(
                              'Articulos', controla.listaMensajes![0].mensaje,
                              duration: const Duration(seconds: 3),
                              icon: const Icon(Icons.info),
                              shouldIconPulse: true,
                              backgroundColor: Colors.blue);
                        });
                      }
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ),
              ]),
              const SizedBox(
                height: 40,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                  onPressed: () {
                    Get.toNamed("/listInventario");
                  },
                  child: const Text(
                    'Inicio',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
