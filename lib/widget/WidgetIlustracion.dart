import 'package:flutter/material.dart';
import 'package:software_clinico/theme.dart';

class WidgetIlustracion extends StatelessWidget {
  final Widget child;
  final String image;
  final String titulo;
  final String subtitulo1;
  final String subtitulo2;

  const WidgetIlustracion(
      {super.key,
      required this.child,
      required this.image,
      required this.titulo,
      required this.subtitulo1,
      required this.subtitulo2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            titulo,
            style: StyloTextClaro.copyWith(fontSize: 30, color: PrincipalColor),
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subtitulo1,
                style: StyloTextClaro.copyWith(
                    fontSize: 18, color: grisNegritaColor),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              textAlign: TextAlign.justify,
              subtitulo2,
              style: StyloTextClaro.copyWith(
                fontSize: 10,
                color: grisClaroColor,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              image,
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assets/img_Logo_finalclinico_sinfondo.png",
                  width: 200,
                ),
                child,
              ],
            ),
            child
          ],
        )
      ],
    );
  }
}
