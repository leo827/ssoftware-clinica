import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_clinico/pages/PaginaLogin.dart';
import 'package:software_clinico/theme.dart';

class Configuracion extends StatelessWidget {
  const Configuracion({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Configuración",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 25, // Se ha ajustado el radio del CircleAvatar
                backgroundImage: AssetImage(
                    "assets/profile-bg-1.jpg"), // Ruta de la imagen ajustada
              ),
              title: const Text(
                "Nombre.Login",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              subtitle: Text(
                "Perfil",
                style:
                    StyloTextRegular.copyWith(fontSize: 12, color: Colorgris),
              ),
            ),
            const Divider(
              height: 40,
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 187, 224, 255),
                    shape: BoxShape.circle),
                child: Icon(
                  CupertinoIcons.person,
                  color: Colors.blue[400],
                  size: 20,
                ),
              ),
              title: const Text(
                "Perfil",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.purple.shade100, shape: BoxShape.circle),
                child: const Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.purple,
                  size: 20,
                ),
              ),
              title: const Text(
                "Notificaciones",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.indigo.shade100, shape: BoxShape.circle),
                child: const Icon(
                  Icons.privacy_tip_outlined,
                  color: Colors.indigo,
                  size: 20,
                ),
              ),
              title: const Text(
                "Privacidad",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.green.shade100, shape: BoxShape.circle),
                child: const Icon(
                  Icons.settings_suggest_outlined,
                  color: Colors.green,
                  size: 20,
                ),
              ),
              title: const Text(
                "General",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.orange.shade100, shape: BoxShape.circle),
                child: const Icon(
                  Icons.settings_suggest_outlined,
                  color: Colors.orange,
                  size: 20,
                ),
              ),
              title: const Text(
                "Acerca de ",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              height: 10,
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                  // Reemplaza la página actual con la página de inicio de sesión
                  context,
                  MaterialPageRoute(builder: (context) => PaginaLogin()),
                );
              },
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.redAccent.shade100, shape: BoxShape.circle),
                child: const Icon(
                  Icons.logout_outlined,
                  color: Colors.redAccent,
                  size: 20,
                ),
              ),
              title: const Text(
                "Cerrar Sesión",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
