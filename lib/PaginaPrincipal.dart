import 'package:flutter/material.dart';
import 'package:software_clinico/widget/NavegadorPrincipal.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NavgeadorPrincila(),
    );
  }
}
