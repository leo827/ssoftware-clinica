import 'package:flutter/material.dart';
import 'package:software_clinico/pages/Index.dart';
import 'package:software_clinico/theme.dart';
import 'package:software_clinico/widget/Slider.dart';

class BienvenidoPagina extends StatelessWidget {
  const BienvenidoPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Index()));
                      },
                      child: Text(
                        "SALTAR",
                        style: TextStyle(
                            fontSize: 15,
                            color: PrincipalColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Bienvenidos",
                          style: TextStyle(
                              fontSize: 40,
                              color: PrincipalColor,
                              fontWeight: FontWeight.w800),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "A Software Clinico",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            textAlign: TextAlign.justify,
                            "Software clínico está diseñado pensando en el usuario, ofreciendo una suite integral de herramientas que facilitan y mejoran la gestión de la atención médica.",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      )
                    ],
                  ),
                  SlidersPrincipal()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
