import 'package:flutter/material.dart';
import 'package:software_clinico/PaginaPrincipal.dart';
import 'package:software_clinico/theme.dart';

class Menu_Drawer extends StatefulWidget {
  const Menu_Drawer({super.key});

  @override
  State<Menu_Drawer> createState() => _Menu_DrawerState();
}

class _Menu_DrawerState extends State<Menu_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text("Bienvenidos,"),
              accountEmail: const Text("Nombre Usuario"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 0,
                child: Image.asset(
                  'assets/img_Logo_finalclinico_sinfondo.png',
                  width: 350.0,
                  height: 300.0,
                ),
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 20, 186, 212),
              ),
              otherAccountsPictures: [
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaginaPrincipal()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Productos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: .0),
              child: Image.asset(
                'assets/logonuevo1.png',
                fit: BoxFit.contain,
                height: 32,
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                'Bienvenido, Kenny.Hernandez',
                style: StyloTextClaro.copyWith(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
