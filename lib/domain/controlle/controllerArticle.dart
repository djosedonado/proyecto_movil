import 'package:get/get.dart';
import 'package:proyecto_movil/data/service/peticionArticle.dart';
import 'package:proyecto_movil/domain/modals/article.dart';

import '../modals/messge.dart';

class ControllerArticle extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<Article>> listarArticle = Rxn<List<Article>>([]);

  Future<void> listArticle() async {
    listarArticle.value = await PeticionesArticles.getListArticles();
  }

  Future<void> addNewArticles(String name, String codigo, String unidad,
      String idUser, String valor, String image) async {
    _listarMensajes.value = await PeticionesArticles.addNewArticle(
        name, codigo, unidad, idUser, valor, image);
  }

  Future<void> eliminarArticulo(String id) async {
    try {
      _listarMensajes.value = await PeticionesArticles.eliminarArticulo(id);
    } catch (e) {}
  }

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Article>? get listArticlesInventario => listarArticle.value;
}
