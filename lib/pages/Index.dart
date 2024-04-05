import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:software_clinico/Configuracion.dart';
import 'package:software_clinico/pages/Mensaje.dart';
import 'package:software_clinico/pages/PaginaClinico.dart';
import 'package:software_clinico/pages/PaginaInicio.dart';
import 'package:software_clinico/pages/PaginaNotificaciones.dart';
import 'package:software_clinico/theme.dart';
import 'package:software_clinico/widget/buildWelcomeSection.dart';

class Index extends StatefulWidget {
  const Index({Key? key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _selectedIndex = 0;
  final _listapagina = const [
    PaginaInicio(),
    Mensaje(),
    PaginaClincio(),
    Notificaciones(),
    Configuracion(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFondo,
      appBar: AppBar(
        backgroundColor: PrincipalColor,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 24,
        ),
        title: const Center(
          child: Text(
            "Inicio",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: const [],
      ),
      body: _selectedIndex == 0
          ? buildWelcomeSection()
          : _listapagina.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(CupertinoIcons.chat_bubble_text_fill, 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(FontAwesomeIcons.userDoctor, 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.notifications, 3),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.account_circle_outlined, 4),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    final isSelected = _selectedIndex == index;

    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSelected ? PrincipalColor : Colors.transparent,
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.white : PrincipalColor,
        size: 24,
      ),
    );
  }
}
