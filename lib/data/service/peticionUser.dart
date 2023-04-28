import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:proyecto_movil/domain/modals/User.dart';
import 'package:proyecto_movil/domain/modals/messge.dart';
import 'package:http/http.dart' as http;

class PeticionesUser {
  static Future<List<Messge>> registerPeticionUser(String email,
      String password, String name, String surname, int state) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/pruebas/agregarUser.php");

    final response = await http.post(url, body: {
      'email': email,
      'password': password,
      'name': name,
      'surname': surname,
      'state': state
    });

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static List<Messge> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['messge']);
    return pasar.map<Messge>((json) => Messge.desdeJson(json)).toList();
  }

  static Future<List<User>> authPeticionUser(
      String email, String password) async {
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
