import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:software_clinico/Configuracion.dart';
import 'package:software_clinico/pages/Mensaje.dart';
import 'package:software_clinico/pages/PaginaClinico.dart';
import 'package:software_clinico/pages/PaginaInicio.dart';
import 'package:software_clinico/pages/PaginaNotificaciones.dart';
import 'package:software_clinico/theme.dart';

class NavgeadorPrincila extends StatefulWidget {
  const NavgeadorPrincila({super.key});
  @override
  State<NavgeadorPrincila> createState() => _NavgeadorPrincilaState();
}

class _NavgeadorPrincilaState extends State<NavgeadorPrincila> {
  int _selectindex = 0;
  final _listapagina = [
    const PaginaInicio(),
    const Mensaje(),
    const PaginaClincio(),
    const Notificaciones(),
    const Configuracion(),
  ];
  onTappeditem(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listapagina.elementAt(_selectindex),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color.fromRGBO(17, 120, 117, 0.886),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text_fill),
              label: "Mensaje"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.userDoctor), label: "Medico"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news), label: "Notificaciones"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Perfil")
        ],
        currentIndex: _selectindex,
        onTap: onTappeditem,
        unselectedItemColor: PrincipalColor,
      ),
    );
  }
}
