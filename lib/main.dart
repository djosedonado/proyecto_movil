import 'package:flutter/cupertino.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';
import 'package:proyecto_movil/ui/app.dart';
import 'package:get/get.dart';

void main(){
  Get.put(ControllerUser());
  runApp(App());
}