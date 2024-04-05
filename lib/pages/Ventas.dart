import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:software_clinico/Red/Modelo/Producto.dart';
import 'package:software_clinico/pages/BuscarMenu.dart';
import 'package:software_clinico/theme.dart';
import 'package:software_clinico/widget/FormularioCategoria.dart';
import 'package:software_clinico/widget/card_categoria.dart';
import 'package:software_clinico/widget/card_productos.dart';

class Ventas extends StatefulWidget {
  const Ventas({super.key});

  @override
  State<Ventas> createState() => _VentasState();
}

class _VentasState extends State<Ventas> {
  late int index;
  bool Filtro = false;
  late Future<List<ProductoCategoria>> _listaCategorias;
  late Future<List<ProductoModelo>> _listaProducto;

  Future<List<ProductoCategoria>> Buscacategoria() async {
    var url =
        Uri.parse("http://localhost/SoftMovil/obtener_producto_categoria.php");
    final response = await http.post(url, body: {});
    return compute(pasarcategoria, response.body);
  }

  List<ProductoCategoria> pasarcategoria(String respuestaBody) {
    final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

    return pasar
        .map<ProductoCategoria>((json) => ProductoCategoria.fromJson(json))
        .toList();
  }

  Future<List<ProductoModelo>> BuscaproductoFiltradoPorCategoria(
      int idCategoria) async {
    var url = Uri.parse("http://localhost/SoftMovil/obtener_producto.php");
    final response = await http.post(url, body: {
      'id_categoria': idCategoria.toString(),
    });

    return compute(pasarproducto, response.body);
  }

  List<ProductoModelo> pasarproducto(String respuestaBody) {
    final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

    return pasar
        .map<ProductoModelo>((json) => ProductoModelo.fromJson(json))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _listaCategorias = Buscacategoria();
    _listaProducto = Future.value([]);
  }

  void _onCategoriaSelected(int categoriaId) {
    setState(() {
      _listaProducto = BuscaproductoFiltradoPorCategoria(categoriaId);
      Filtro = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return FormularioCategoria();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
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
                                Icons.shopping_cart_outlined,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BuscarMenu()));
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
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: Text(
                      "Categorias de Medicamentos",
                      style: StyloTextRegular.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FutureBuilder<List<ProductoCategoria>>(
                    future: _listaCategorias,
                    builder: (context, cat) {
                      if (cat.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (cat.hasError) {
                        return Center(child: Text('Error: ${cat.error}'));
                      } else if (cat.hasData && cat.data!.isNotEmpty) {
                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemCount: cat.data!.length,
                          itemBuilder: (context, i) {
                            ProductoCategoria categoria = cat.data![i];
                            return InkWell(
                              onTap: () =>
                                  _onCategoriaSelected(categoria.idcategoria),
                              borderRadius: BorderRadius.circular(10),
                              child: CardCategoria(
                                  ImagenCategoria: categoria.imagen,
                                  NbreCategoria: categoria.categoria),
                            );
                          },
                        );
                      } else {
                        return const Center(
                            child: Text("No se encontraron datos."));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  FutureBuilder<List<ProductoModelo>>(
                    future: Filtro ? _listaProducto : Future.value([]),
                    builder: (context, produc) {
                      if (produc.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (produc.hasError) {
                        return Center(child: Text('Error: ${produc.error}'));
                      } else if (produc.hasData && produc.data!.isNotEmpty) {
                        return GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16),
                          itemCount: produc.data!.length,
                          itemBuilder: (context, i) {
                            ProductoModelo producto = produc.data![i];
                            return InkWell(
                              borderRadius: BorderRadius.circular(10),
                              child: CardProducto(
                                ImagenProducto: producto.imagen,
                                NbreProducto: producto.Nbre,
                                Precio: producto.precio,
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                            child: Text("No se encontraron datos."));
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
