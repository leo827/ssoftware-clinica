import 'package:flutter/material.dart';
import 'package:software_clinico/pages/PaginaLogin.dart';
import 'package:software_clinico/theme.dart';
import 'package:software_clinico/widget/GeneralLogo.dart';

class Pantalla extends StatelessWidget {
  const Pantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img_fondopantalla.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: GeneralLogo(
                    child: Text(""),
                  ),
                ),
              ],
            ),
            Positioned(
              top: -10,
              left: 200,
              child: Container(
                width: 2000,
                height: 85,
                decoration: BoxDecoration(
                  color: const Color(0xFF83e41b),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Image.asset(
                      "img_add.png",
                      height: 20,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 270,
              left: -20,
              child: Container(
                  width: 220,
                  height: 270,
                  decoration: BoxDecoration(
                    color: const Color(0xFF83e41b),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Nuestro Servicios",
                          style: StyloTextNegrita.copyWith(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ListTile(
                          leading: const Icon(Icons.assignment),
                          title: Text(
                            "Historia Clinica Digital",
                            style: StyloTextNegrita.copyWith(fontSize: 12),
                          ),
                          subtitle: Text(
                            "Tenemos una solucion para la atencion.",
                            style: StyloTextRegular.copyWith(
                                fontSize: 10, color: grisNegritaColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ListTile(
                          leading: const Icon(Icons.assignment),
                          title: Text(
                            "Factura Electronica",
                            style: StyloTextNegrita.copyWith(fontSize: 12),
                          ),
                          subtitle: Text(
                            "Tenemos una solucion para la atencion.",
                            style: StyloTextRegular.copyWith(
                                fontSize: 10, color: grisNegritaColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ListTile(
                          leading: const Icon(Icons.assignment),
                          title: Text(
                            "Laboratorio",
                            style: StyloTextNegrita.copyWith(fontSize: 12),
                          ),
                          subtitle: Text(
                            "Tenemos una solucion para la atencion.",
                            style: StyloTextRegular.copyWith(
                                fontSize: 10, color: grisNegritaColor),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Positioned(
              top: 70,
              left: 270,
              child: Container(
                width: 2000,
                height: 800,
                decoration: BoxDecoration(
                  color: const Color(0xFF1178b1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: 205,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  "assets/img_img_inicial1.png",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 120,
                left: 25,
                child: Text(
                  "SOFTWARE",
                  style: StyloTextNegrita.copyWith(
                    fontSize: 30,
                  ),
                )),
            Positioned(
                top: 160,
                left: 25,
                child: Text(
                  "CLINICO",
                  style: StyloTextNegrita.copyWith(
                      fontSize: 20, color: grisClaroColor),
                )),
            Positioned(
              top: 200,
              left: 25,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Somos una empresa que ofrecemos una solución \ncon un software que se enfocará \nen mejorar la eficiencia y la calidad del \ncuidado de la salud mediante la digitalización \ny automatización de procesos",
                  style: StyloTextNegrita.copyWith(
                      fontSize: 8, color: grisClaroColor),
                ),
              ),
            ),
            Positioned(
              top: 240,
              left: 205,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                child: Image.asset(
                  "assets/img_img_inicial2.png",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 420,
              left: 205,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  "assets/fondo Doc001.jpg",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 600,
                left: 10,
                child: SizedBox(
                  width: 180,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaginaLogin()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xf03871c1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text("EMPECEMOS"),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
