import 'package:flutter/material.dart';
import 'package:software_clinico/pages/Bienvenida.dart';
import 'package:software_clinico/pages/IngresoPaciente.dart';

void main() => runApp(const Principal());

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Ingreso': (context) => IngresoPaciente(),
        //'/Configuracion': (context) => Configuracion(),
        // '/Compras': (context) => Ventas(),
      },
      debugShowCheckedModeBanner: false,
      home: const BienvenidoPagina(),
    );
  }
}
