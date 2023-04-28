import 'package:get/get.dart';
import 'package:proyecto_movil/data/service/peticionUser.dart';
import 'package:proyecto_movil/domain/modals/User.dart';
import 'package:proyecto_movil/domain/modals/messge.dart';

class ControllerUser extends GetxController {
  final Rxn<List<Messge>> _listarMensajes = Rxn<List<Messge>>([]);
  final Rxn<List<User>> _listUser = Rxn<List<User>>([]);

  Future<void> authUser(String email,String password) async{
    _listUser.value = await PeticionesUser.authPeticionUser(email, password);
  }

  
  List<Messge>?get listFynaliMessge => _listarMensajes.value;
  List<User>?get listUserAuth => _listUser.value;
}