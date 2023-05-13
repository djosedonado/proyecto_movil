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
                child: Image.memory(
                  bytes,
                  width: 100,
                  height: 200,
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
