import 'package:flutter/material.dart';
import 'package:software_clinico/theme.dart';
import 'package:software_clinico/widget/WidgetIlustracion.dart';
import 'package:software_clinico/widget/boton_home.dart';

class BuscarMenu extends StatefulWidget {
  const BuscarMenu({super.key});

  @override
  State<BuscarMenu> createState() => _BuscarMenuState();
}

class _BuscarMenuState extends State<BuscarMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 32,
                    color: PrincipalColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffe4faf0)),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xffb1d8b2),
                        ),
                        hintText: "Buscar...",
                        hintStyle:
                            TextStyle(fontSize: 15, color: Color(0xffb1d8b2))),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: SafeArea(
              child: WidgetIlustracion(
                  image: "assets/sin dato.png",
                  titulo: "No se encontro Resultado",
                  subtitulo1: "Sigue Buscando",
                  subtitulo2: "nuestro Software Clinico",
                  child: BotonHome()),
            ),
          ),
        ],
      )),
    );
  }
}
