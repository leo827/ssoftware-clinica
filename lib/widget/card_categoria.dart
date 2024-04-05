import 'package:flutter/material.dart';
import 'package:software_clinico/theme.dart';

class CardCategoria extends StatelessWidget {
  const CardCategoria(
      {super.key, required this.ImagenCategoria, required this.NbreCategoria});
  final String ImagenCategoria;
  final String NbreCategoria;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image.asset(
            ImagenCategoria,
            width: 60,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            NbreCategoria,
            style: StyloTextMedio.copyWith(fontSize: 8),
          )
        ],
      ),
    );
  }
}
