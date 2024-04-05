import 'package:flutter/material.dart';
import 'package:software_clinico/pages/PaginaLogin.dart';

class BotonPrimario extends StatelessWidget {
  final Color colorVerde =
      Colors.green; // Definición de ColorVerde como ejemplo

  const BotonPrimario({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      height: 20,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => PaginaLogin()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 71, 211, 125),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: const Text("EMPECEMOS"),
      ),
    );
  }
}
