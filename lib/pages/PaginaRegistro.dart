import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:software_clinico/Red/APIs/UrlApi.dart';
import 'package:software_clinico/pages/PaginaLogin.dart';
import 'package:software_clinico/theme.dart';
import 'package:software_clinico/widget/GeneralLogo.dart';

class PaginaRegistro extends StatefulWidget {
  const PaginaRegistro({super.key});

  @override
  _PaginaRegistroState createState() => _PaginaRegistroState();
}

class _PaginaRegistroState extends State<PaginaRegistro> {
  TextEditingController NbreControlador = TextEditingController();
  TextEditingController CorreoControlador = TextEditingController();
  TextEditingController TelefonoControlador = TextEditingController();
  TextEditingController DireccionControlador = TextEditingController();
  TextEditingController passwordControlador = TextEditingController();

  bool _secureText = true;

  void showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  RegistroEntrega() async {
    var resgitrourl = Uri.parse(BASEURL.apiresgistro);
    final response = await http.post(resgitrourl, body: {
      "Nbre": NbreControlador.text,
      "Correo": CorreoControlador.text,
      "Telefono": TelefonoControlador.text,
      "Direccion": DireccionControlador.text,
      "password": passwordControlador.text,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];

    if (value == 1) {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: (Colors.green),
                  size: 70,
                ),
                title: const Text("Transacion Exitosa"),
                content: Text(message, textAlign: TextAlign.center),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaginaLogin()),
                            (route) => false);
                      },
                      child: const Text("Ok"))
                ],
              ));
      setState(() {});
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: (Colors.red),
                  size: 70,
                ),
                title: const Text("Transacion Error"),
                content: Text(message, textAlign: TextAlign.center),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok"))
                ],
              ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const GeneralLogo(child: Text("")),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "REGISTRO",
                  style: StyloTextRegular.copyWith(fontSize: 25),
                ),
                Text(
                  "Registra ahora tu cuenta",
                  style: StyloTextRegular.copyWith(
                      fontSize: 15, color: grisClaroColor),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 185, 183, 183),
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0,
                        )
                      ],
                      color: ColorBlanco),
                  child: TextField(
                    controller: NbreControlador,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Usuario",
                        hintStyle: StyloTextClaro.copyWith(
                            fontSize: 13, color: grisClaroColor)),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 185, 183, 183),
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0,
                        )
                      ],
                      color: ColorBlanco),
                  child: TextField(
                    controller: CorreoControlador,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Correo Electronico",
                        hintStyle: StyloTextClaro.copyWith(
                            fontSize: 13, color: grisClaroColor)),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 185, 183, 183),
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0,
                        )
                      ],
                      color: ColorBlanco),
                  child: TextField(
                    controller: DireccionControlador,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Direccion",
                        hintStyle: StyloTextClaro.copyWith(
                            fontSize: 13, color: grisClaroColor)),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 185, 183, 183),
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0,
                        )
                      ],
                      color: ColorBlanco),
                  child: TextField(
                    controller: TelefonoControlador,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Telefono",
                        hintStyle: StyloTextClaro.copyWith(
                            fontSize: 13, color: grisClaroColor)),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 185, 183, 183),
                        offset: Offset(0, 1),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ],
                    color: ColorBlanco,
                  ),
                  child: TextField(
                    controller: passwordControlador,
                    obscureText: _secureText,
                    decoration: InputDecoration(
                      hintText: "Contraseña",
                      border: InputBorder.none,
                      hintStyle: StyloTextClaro.copyWith(
                          fontSize: 13, color: grisClaroColor),
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: Icon(
                          _secureText ? Icons.visibility_off : Icons.visibility,
                          color: _secureText
                              ? Colors.grey
                              : const Color.fromARGB(255, 71, 211, 125),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (NbreControlador.text.isEmpty ||
                              CorreoControlador.text.isEmpty ||
                              DireccionControlador.text.isEmpty ||
                              TelefonoControlador.text.isEmpty ||
                              passwordControlador.text.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      icon: const Icon(
                                        Icons.info_outline,
                                        color:
                                            (Color.fromARGB(255, 68, 71, 255)),
                                        size: 55,
                                      ),
                                      title: const Text("Informacion"),
                                      content: const Text(
                                          "Por favor, Inserte todos los datos"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Ok"))
                                      ],
                                    ));
                          } else {
                            RegistroEntrega();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 88, 219, 127),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text("REGISTRARSE"),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¿Ya tienes una cuenta?  ",
                      style: StyloTextClaro.copyWith(
                          color: grisClaroColor, fontSize: 13),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaginaLogin()));
                      },
                      child: Text(
                        "Iniciar Sesión Ahora",
                        style: StyloTextNegrita.copyWith(
                            color: PrincipalColor, fontSize: 13),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
