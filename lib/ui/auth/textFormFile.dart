import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormFile_Input extends StatelessWidget {
  final TextEditingController? controller;
  final dynamic funcion;
  final Color? colors;
  final Icon? icono;
  final String texto;
  final String? hintText;
  final TextInputType? tipoTeclado;
  final bool? pass;
  final bool? editable;
  final bool? editarPerfil;
  const TextFormFile_Input(
      {Key? key,
      this.funcion,
      this.colors,
      this.icono,
      this.editarPerfil = false,
      this.controller,
      this.hintText,
      required this.texto,
      this.tipoTeclado = TextInputType.text,
      this.pass,
      this.editable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Campo Vacio";
        }
        if (texto == "Password") {
          if (value.length < 6 || value.length > 20) {
            return "El rango es de 6 a 20";
          }
        }
        if (texto == "Email") {
          if (value!.isEmpty == value.isEmail) {
            return "Dominio Icorrecto";
          }
        }
        if (texto == "Name") {
          if (value.length < 2 || value.length > 30) {
            return "El nombre es 2 y 30";
          }
        }
        if(texto == 'Cantidad' || texto == 'Valor'){
          if(value.length<1){
            return "no es permitido valores negativos";
          }
        }
        return null;
      },
      keyboardType: tipoTeclado,
      enabled: editable,
      obscureText: pass ?? false,
      style: TextStyle(
          fontSize: 20, color: colors == null ? Colors.white : colors),
      decoration: InputDecoration(
          icon: icono,
          labelStyle: TextStyle(color: colors == null ? Colors.white : colors),
          hintText: hintText ?? '',
          hintStyle: TextStyle(color: colors == null ? Colors.white : colors),
          labelText: texto,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: colors ?? Colors.white, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: colors ?? Colors.white, width: 1)),
          isDense: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      controller: controller,
      onEditingComplete: funcion,
    );
  }
}
