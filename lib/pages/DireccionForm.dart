import 'package:flutter/material.dart';
import 'package:software_clinico/pages/IngresoCampo%20.dart';

class DireccionForm extends StatelessWidget {
  final TextEditingController municipioController = TextEditingController();
  final TextEditingController barrioController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          IngresoCampo(controller: municipioController, labelText: 'Municipio'),
          const SizedBox(height: 15),
          IngresoCampo(controller: barrioController, labelText: 'Barrio'),
          const SizedBox(height: 15),
          IngresoCampo(controller: direccionController, labelText: 'Dirección'),
        ],
      ),
    );
  }
}
