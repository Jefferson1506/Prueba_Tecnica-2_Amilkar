// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/registro.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usuario = TextEditingController();
  final TextEditingController clave = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              "img/fondo_login.svg",
              fit: BoxFit.cover,
              color: Color.fromARGB(255, 214, 218, 200),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.14,
            child: Logo(context),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.40,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.10,
                    ),
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: CajaTextoIcono(
                      hintText: "Usuario",
                      controller: usuario,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: CajaTextoOculto(
                      hintText: "Contraseña",
                      controller: clave,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.73,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.055,
              child: Boton(texto: "Ingresar", size: 23, onpressed: () async {}),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.68,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.3,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registro()));
                },
                child: TextosAzul(texto: "¿No tienes cuenta?", size: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
