import 'package:get/get.dart';

class CajaTextoController extends GetxController {
  RxBool obscureText = true.obs;

  void cambiarEstado() {
    obscureText.toggle();
  }
}

class DocumentoController extends GetxController {
  var documento = ''.obs;
}