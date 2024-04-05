import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:software_clinico/PaginaPrincipal.dart';
import 'package:software_clinico/Red/APIs/UrlApi.dart';
import 'package:software_clinico/pages/PaginaRegistro.dart';
import 'package:software_clinico/theme.dart';
import 'package:software_clinico/widget/GeneralLogo.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  TextEditingController NbreControlador = TextEditingController();
  TextEditingController passwordControlador = TextEditingController();

  bool _secureText = true;

  void showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  LoginEntrega() async {
    var loginurl = Uri.parse(BASEURL.apilogin);
    final response = await http.post(loginurl, body: {
      "username": NbreControlador.text,
      "PASSWORD": passwordControlador.text,
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
                                builder: (context) => const PaginaPrincipal()),
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: context()=>));
                    },
                    child: Text(
                      "SALTAR",
                      style: StyloTextMedio.copyWith(
                          color: PrincipalColor, fontSize: 20),
                    ),
                  ),
                ),
                const GeneralLogo(child: Text("")),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "INICIAR SESION",
                        style: StyloTextRegular.copyWith(fontSize: 25),
                      ),
                      Text(
                        "Inicia Sesion ahora con su cuenta",
                        style: StyloTextRegular.copyWith(
                            fontSize: 15, color: grisClaroColor),
                      ),
                      const SizedBox(
                        height: 18,
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
                                offset: Offset(0, 2),
                                blurRadius: 4,
                                spreadRadius: 1,
                              )
                            ],
                            color: ColorBlanco),
                        child: TextField(
                          controller: NbreControlador,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nombre Usuario",
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
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 1,
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
                                _secureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: _secureText ? Colorgris : PrincipalColor,
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
                                    passwordControlador.text.isEmpty) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            icon: const Icon(
                                              Icons.info_outline,
                                              color: (Color.fromARGB(
                                                  255, 68, 71, 255)),
                                              size: 60,
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
                                  LoginEntrega();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: PrincipalColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: const Text("INICIA SESION"),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Aun no tienes una Cuenta?  ",
                            style: StyloTextClaro.copyWith(
                                color: grisClaroColor, fontSize: 13),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaginaRegistro()));
                            },
                            child: Text(
                              "Resgistrese Ahora",
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
          ),
        ],
      ),
    );
  }
}
