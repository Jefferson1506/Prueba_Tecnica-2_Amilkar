// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/estilos.dart';
import 'package:flutter_application_1/widgets/getX.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget Logo(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.65,
    height: MediaQuery.of(context).size.height * 0.30,
    child: Card(
      color: Color.fromARGB(255,239, 188, 155),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              "img/logo.svg",
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.20,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'BankiYa',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget Icono_decore(
    BuildContext context, String logo, double alto, double ancho) {
  return Container(
    width: MediaQuery.sizeOf(context).width * ancho,
    height: MediaQuery.sizeOf(context).height * alto,
    decoration: BoxDecoration(
        image: DecorationImage(
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            image: AssetImage(logo))),
  );
}

Future AnimacionCarga(BuildContext context) {
  return showDialog(
      barrierColor: Color.fromARGB(180, 244, 246, 252),
      context: context,
      builder: (BuildContext context) {
        return LoadingAnimationWidget.threeRotatingDots(
          color: const Color.fromARGB(255, 5, 10, 48),
          size: 70,
        );
      });
}

class CajaTexto extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CajaTexto({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      cursorColor: Colors.black,
      autofocus: false,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.start,
      style: estiloTextoAzul(23),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        filled: true,
        fillColor: const Color.fromARGB(255, 251, 243, 213),
        hintText: hintText,
        hintStyle: estiloTextoAzul(23),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.circular(22),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }
}

Widget CajaTextoIcono({
  required String hintText,
  required TextEditingController controller,
}) {
  return TextField(
    autocorrect: false,
    cursorColor: Colors.black,
    autofocus: false,
    controller: controller,
    textAlignVertical: TextAlignVertical.center,
    textAlign: TextAlign.start,
    style: estiloTextoAzul(23),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      filled: true,
      fillColor: const Color.fromARGB(255, 251, 243, 213),
      hintText: hintText,
      hintStyle: estiloTextoAzul(23),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        borderRadius: BorderRadius.circular(22),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        borderRadius: BorderRadius.circular(22),
      ),
      suffixIcon: Icon(
        Icons.people,
        color: Colors.black,
        size: 20,
      ),
    ),
  );
}

Widget CajaTextoOculto({
  required String hintText,
  required TextEditingController controller,
}) {
  final CajaTextoController obscureText = Get.put(CajaTextoController());
  return Obx(() => TextField(
        autocorrect: false,
        obscureText: obscureText.obscureText.value,
        obscuringCharacter: "*",
        autofocus: false,
        cursorColor: Colors.black,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 23),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          filled: true,
          fillColor: const Color.fromARGB(255, 251, 243, 213),
          hintText: hintText,
          hintStyle: estiloTextoAzul(23),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.circular(22),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.circular(22),
          ),
          suffixIcon: IconButton(
            color: Colors.black,
            iconSize: 20,
            icon: Icon(obscureText.obscureText.value
                ? Icons.visibility
                : Icons.visibility_off),
            onPressed: () {
              obscureText.cambiarEstado();
            },
          ),
        ),
      ));
}

Widget Boton({
  required String texto,
  required double size,
  required VoidCallback onpressed,
}) {
  return ElevatedButton(
      style: estiloBotonGris,
      onPressed: onpressed,
      child: TextosBlanco(texto: texto, size: size));
}

Widget BotonIcon(
    {required double size,
    required Icon icon,
    required VoidCallback onpressed,
    required bool opcion}) {
  return ElevatedButton(
    style: opcion ? estiloBotonRojo : estiloBotonGris,
    onPressed: onpressed,
    child: Icon(
      icon.icon,
      size: size,
      color: Colors.white,
    ),
  );
}

Widget TextosBlanco({required String texto, required double size}) {
  return Text(
    texto.toString(),
    textAlign: TextAlign.center,
    style: estiloTextoBlanco(size),
  );
}

Widget TextosAzul({required String texto, required double size}) {
  return Text(
    texto.toString(),
    textAlign: TextAlign.center,
    style: estiloTextoAzul(size),
  );
}
