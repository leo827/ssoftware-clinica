import 'package:flutter/material.dart';
import 'package:software_clinico/theme.dart';

class SlidersPrincipal extends StatefulWidget {
  @override
  _SlidersPrincipalState createState() => _SlidersPrincipalState();
}

class _SlidersPrincipalState extends State<SlidersPrincipal> {
  int _IndiceActual = 0;
  final List<String> ListaImagen = [
    'assets/index01.png',
    'assets/index02.png',
    'assets/index03.png',
  ];

  void _siguienteimagen() {
    setState(() {
      _IndiceActual = (_IndiceActual + 1) % ListaImagen.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ListaImagen[_IndiceActual],
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ListaImagen.asMap().entries.map((entry) {
            return Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _IndiceActual == entry.key ? Colors.black : Colors.grey,
              ),
            );
          }).toList(),
        ),
        GestureDetector(
          onTap: _siguienteimagen,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: PrincipalColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Siguiente',
              style: TextStyle(
                color: Colors.white, // Texto blanco
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
