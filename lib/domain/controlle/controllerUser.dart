import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto_movil/data/service/peticionUser.dart';
import 'package:proyecto_movil/domain/modals/User.dart';
import 'package:proyecto_movil/domain/modals/messge.dart';

class ControllerUser extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<User>> listarUser = Rxn<List<User>>([]);
  final _emailLocal = Rxn();
  final _passwordLocal = Rxn();

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

  Future<void> editarUserPerfil(
      String id, String name, String surname, String foto) async {
    _listarMensajes.value =
        await PeticionesUser.editarUserPerfil(id, name, surname, foto);
  }

  Future<void> cambiarPasswordUser(String id, String password) async {
    _listarMensajes.value =
        await PeticionesUser.CambiarPasswordUser(id, password);
  }

  Future<void> eliminarUser(String id) async {
    _listarMensajes.value = await PeticionesUser.eliminarUser(id);
  }

  Future<void> validarUser(String u, String p) async {
    listarUser.value = await PeticionesUser.validarUser(u, p);
    guardarLocal();
  }

  Future<void> listUsers() async {
    listarUser.value = await PeticionesUser.getListUser();
  }

  Future<void> guardarLocal() async {
    GetStorage datosLocales = GetStorage();
    try {
      datosLocales.write('email', listaUserLogin![0].email);
      datosLocales.write('password', listaUserLogin![0].password);
    } catch (e) {}
  }

  Future<void> verLocal() async {
    GetStorage datosLocales = GetStorage();
    try {
      _emailLocal.value = datosLocales.read('email');
      _passwordLocal.value = datosLocales.read('password');
    } catch (e) {}
    print(_emailLocal.value);
  }

  dynamic get emailLocal => _emailLocal.value;
  dynamic get passwordLocal => _passwordLocal.value;
  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<User>? get listaUserLogin => listarUser.value;
}
