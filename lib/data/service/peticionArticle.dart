import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:proyecto_movil/domain/modals/article.dart';

import '../../domain/modals/messge.dart';

class PeticionesArticles {
  //Listar Articulos
  static Future<List<Article>> getListArticles() async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/PaintOut/Bodega/listArticles.php");

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista2, response.body);
  }

  static List<Article> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Article>((json) => Article.desdeJson(json)).toList();
  }

  //Agregar Articulos
  static Future<List<Mensajes>> addNewArticle(String name, String codigo,
      String unidad, String idUser, String valor, String image) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/PaintOut/Bodega/newArticle.php");

    final response = await http.post(url, body: {
      'name': name,
      'codigo': codigo,
      'unidad': unidad,
      'idUser': idUser,
      'valor': valor,
      'image': image,
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

  //Eliminar Articulos
  static Future<List<Mensajes>> eliminarArticulo(String id) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/PaintOut/Bodega/deleteArticle.php");

    final response = await http.post(url, body: {
      'id': id,
    });

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  //Editar Articulos
}
