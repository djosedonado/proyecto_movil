import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_movil/domain/controlle/controllerArticle.dart';

class ListInventario extends StatelessWidget {
  const ListInventario({super.key});
  @override
  Widget build(BuildContext context) {
    ControllerArticle controla = Get.find();
    controla.listArticle();
    controla.listarArticle.refresh();
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventario"),
        actions: [
          IconButton(
              onPressed: () {
                controla.listArticle();
                controla.listarArticle.refresh();
              },
              icon: Icon(Icons.update))
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controla.listArticlesInventario!.length,
          itemBuilder: (BuildContext context, int index) {
            Uint8List bytes =
                base64Decode(controla.listArticlesInventario![index].img);
            return ListTile(
              leading: SizedBox(
                child: InteractiveViewer(
                  boundaryMargin:
                      EdgeInsets.all(20.0), // Margen alrededor del contenido
                  minScale: 0.5, // Escala mínima permitida
                  maxScale: 4.0, // Escala máxima permitida
                  child: Image.memory(
                  bytes,
                  width: 100,
                  height: 200,
                ), // Ruta o URL de la imagen que deseas mostrar
                ),
              ),
              title: Row(
                children: [
                  Text(controla.listArticlesInventario![index].name),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text("Unidad: " +
                      controla.listArticlesInventario![index].unidad.toString())
                ],
              ),
              subtitle: Text("Valor " +
                  controla.listArticlesInventario![index].valor.toString()),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
