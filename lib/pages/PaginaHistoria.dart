import 'package:flutter/material.dart';

class PaginaHistoria extends StatefulWidget {
  const PaginaHistoria({super.key});

  @override
  State<PaginaHistoria> createState() => _PaginaHistoriaState();
}

class _PaginaHistoriaState extends State<PaginaHistoria> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hola Pagina Historia"),
      ),
    );
  }
}
