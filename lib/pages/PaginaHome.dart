import 'package:flutter/material.dart';
import 'package:software_clinico/Red/Modelo/Menus.dart';
import 'package:software_clinico/pages/BuscarMenu.dart';
import 'package:software_clinico/theme.dart';

class PaginaHome extends StatefulWidget {
  const PaginaHome({super.key});

  @override
  State<PaginaHome> createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PaginaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 35, 20, 35),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Esto distribuye el espacio disponible de manera uniforme entre los widgets
                        children: [
                          Image.asset(
                            "assets/img_logosinnombre.png",
                            width: 45,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Software Clinico",
                            style: StyloTextRegular.copyWith(
                                fontSize: 15, color: grisClaroColor),
                          ),
                          const SizedBox(
                            width: 95,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_none_outlined,
                                color: PrincipalColor,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "Somos una solucion para los procesos \nClinicos y Farmaceuticos",
              style: StyloTextRegular.copyWith(
                  fontSize: 11, color: grisNegritaColor),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BuscarMenu()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffe4faf0)),
                child: const TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xffb1d8b2),
                      ),
                      hintText: "Buscar...",
                      hintStyle:
                          TextStyle(fontSize: 15, color: Color(0xffb1d8b2))),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Modulos Clinicos",
              style: StyloTextRegular.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: iconos.length,
              itemBuilder: (context, index) {
                IconoMenu iconoMenu = iconos[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.pushNamed(context, iconoMenu.ruta);
                      },
                      child: ClipRRect(
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffe4faf0),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            iconoMenu.icono,
                            size: 48,
                            color: const Color.fromRGBO(17, 120, 117, 0.886),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      iconoMenu.Nbre,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
