import 'package:flutter/material.dart';

class ingreso_paciente extends StatelessWidget {
  const ingreso_paciente({
    super.key,
    required this.controller,
    required this.labelText,
    required String? Function(dynamic value) validator,
  });

  final TextEditingController controller;
  final String labelText;

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
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: controller.text.isEmpty ? labelText : '',
        ),
      ),
    );
  }
}
