import 'package:get/get.dart';
import 'package:proyecto_movil/data/service/peticionUser.dart';
import 'package:proyecto_movil/domain/modals/User.dart';
import 'package:proyecto_movil/domain/modals/messge.dart';

class ControllerUser extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<User>> listarUser = Rxn<List<User>>([]);

  Future<void> crearUser(String name, String surname, String email,
      String password, String rol, String state) async {
    _listarMensajes.value = await PeticionesUser.registrarUser(
        name, surname, email, password, rol, state);
  }

  Future<void> editarUser(String id, String name, String surname, String email,
      String password, String rol, String state) async {
    _listarMensajes.value = await PeticionesUser.editarUser(
        id, name, surname, email, password, rol, state);
  }

  Future<void> eliminarUser(String id) async {
    _listarMensajes.value = await PeticionesUser.eliminarUser(id);
  }

  Future<void> validarUser(String u, String p) async {
    listarUser.value = await PeticionesUser.validarUser(u, p);
  }

  Future<void> listUsers() async {
    listarUser.value = await PeticionesUser.getListUser();
  }

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<User>? get listaUserLogin => listarUser.value;
}