import 'package:flutter/material.dart';
import 'package:software_clinico/PaginaPrincipal.dart';

class BotonHome extends StatelessWidget {
  final Color colorVerde =
      Colors.green; // Definición de ColorVerde como ejemplo

  const BotonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const PaginaPrincipal()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 88, 219, 127),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: const Text("REGRESAR AL INICIO"),
      ),
    );
  }
}
