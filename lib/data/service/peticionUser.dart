import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:proyecto_movil/domain/modals/User.dart';
import 'package:proyecto_movil/domain/modals/messge.dart';
import 'package:http/http.dart' as http;

class PeticionesUser {
//Metodo de llamar listas
  static Future<List<User>> getListUser() async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/PaintOut/listarUsers.php");

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista2, response.body);
  }

//Metodo de Modificacion
  static Future<List<Mensajes>> editarUser(
      String id,
      String name,
      String surname,
      String email,
      String password,
      String rol,
      String state) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/PaintOut/editUser.php");

    final response = await http.post(url, body: {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'rol': rol,
      'state': state,
    });

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  // Metodo editar Perfil
  static Future<List<Mensajes>> editarUserPerfil(
      String id, String name, String surname, String foto) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/PaintOut/editarPerfil.php");

    final response = await http.post(url, body: {
      'id': id,
      'image': foto,
      'name': name,
      'surname': surname,
    });

    print(response.statusCode);
    //print(response.body);
    return compute(convertirAlista, response.body);
  }

  //Metodo Cambiar Contraseña
  static Future<List<Mensajes>> CambiarPasswordUser(
      String id, String password) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/PaintOut/cambiarPassword.php");

    final response = await http.post(url, body: {
      'id': id,
      'pass': password,
    });

    print(response.statusCode);
    //print(response.body);
    return compute(convertirAlista, response.body);
  }

// Metodo de Eliminacion
  static Future<List<Mensajes>> eliminarUser(String id) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/PaintOut/deleteUser.php");

    final response = await http.post(url, body: {
      'id': id,
    });

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

// Metodo de registrar
  static Future<List<Mensajes>> registrarUser(String name, String surname,
      String email, String password, String rol, String state) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/PaintOut/newUser.php");

    final response = await http.post(url, body: {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'rol': rol,
      'state': state
    });

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static List<Mensajes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<User>> validarUser(String email, String password) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/PaintOut/validarUser.php");

    final response =
        await http.post(url, body: {'email': email, 'password': password});

    return compute(convertirAlista2, response.body);
  }

  static List<User> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<User>((json) => User.desdeJson(json)).toList();
  }
}
