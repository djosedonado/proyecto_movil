import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';
import 'package:proyecto_movil/ui/pages/menu.dart';

class MenuBodega extends StatelessWidget {
  const MenuBodega({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Bodega"),
      ),
      body: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.3),
              child: Text(
                  "WELCOME ${controlu.listaUserLogin![0].Name}  ${controlu.listaUserLogin![0].surName}"),
            ),
            
          ],
        ),
      ),
      drawer: Menu(Name: controlu.listaUserLogin![0].Name,surName: controlu.listaUserLogin![0].surName,),
    );
  }
}
