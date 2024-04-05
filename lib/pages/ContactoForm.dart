import 'package:flutter/material.dart';
import 'package:software_clinico/pages/IngresoCampo%20.dart';

class ContactoForm extends StatelessWidget {
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController movilController = TextEditingController();
  final TextEditingController correoElectronicoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          IngresoCampo(controller: telefonoController, labelText: 'Teléfono'),
          const SizedBox(height: 15),
          IngresoCampo(controller: movilController, labelText: 'Móvil'),
          const SizedBox(height: 15),
          IngresoCampo(
              controller: correoElectronicoController,
              labelText: 'Correo Electrónico'),
        ],
      ),
    );
  }
}
