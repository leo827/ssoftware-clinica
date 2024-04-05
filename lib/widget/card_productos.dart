import 'package:flutter/material.dart';
import 'package:software_clinico/theme.dart';

class CardProducto extends StatelessWidget {
  const CardProducto(
      {super.key,
      required this.ImagenProducto,
      required this.NbreProducto,
      required this.Precio});

  final String ImagenProducto;
  final String NbreProducto;
  final String Precio;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image.network(
            ImagenProducto,
            width: 115,
            height: 76,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            NbreProducto,
            style: StyloTextRegular.copyWith(fontSize: 10),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            Precio,
            style: StyloTextNegrita.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
