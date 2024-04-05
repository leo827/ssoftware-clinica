import 'package:flutter/material.dart';

class IngresoCampo extends StatelessWidget {
  const IngresoCampo({
    Key? key,
    required this.controller,
    required this.labelText,
    this.enabled = true,
    this.estiloText,
    this.colorFondo,
    this.borderColor, // Agregar la propiedad borderColor
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool enabled;
  final TextStyle? estiloText;
  final Color? colorFondo;
  final Color? borderColor; // Definir la propiedad borderColor

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 185, 183, 183),
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 1,
          )
        ],
        color: colorFondo ?? Colors.white,
        border: Border.all(
          color: borderColor ??
              Colors.transparent, // Usar borderColor si está definido
        ),
      ),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo obligatorio';
          }
          return null;
        },
        style: estiloText, // Aplicar el estilo de texto si está definido
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
        ),
      ),
    );
  }
}
