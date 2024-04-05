class ProductoCategoria {
  final int idcategoria;
  final String categoria;
  final String imagen;
  final String estado;
  final List<ProductoModelo> product;

  ProductoCategoria(
      {required this.idcategoria,
      required this.categoria,
      required this.imagen,
      required this.estado,
      required this.product});
  factory ProductoCategoria.fromJson(Map<String, dynamic> data) {
    var list = data['product'] as List? ?? [];
    List<ProductoModelo> Listaproducto = list
        .map((e) => ProductoModelo.fromJson(e as Map<String, dynamic>))
        .toList();
    return ProductoCategoria(
      idcategoria: int.parse(data['idcategoria']),
      categoria: data['categoria'] as String? ?? '',
      estado: data['estado'] as String? ?? '',
      imagen: data['imagen'] as String? ?? '',
      product: Listaproducto,
    );
  }
}

class ProductoModelo {
  final String id_producto;
  final String id_categoria;
  final String Nbre;
  final String descripcion;
  final String imagen;
  final String precio;
  final String estado;

  ProductoModelo({
    required this.id_producto,
    required this.id_categoria,
    required this.Nbre,
    required this.descripcion,
    required this.imagen,
    required this.precio,
    required this.estado,
  });
  factory ProductoModelo.fromJson(Map<String, dynamic> data) {
    return ProductoModelo(
      id_producto: data['id_producto'],
      id_categoria: data['id_categoria'],
      Nbre: data['Nbre'],
      descripcion: data['descripcion'],
      imagen: data['imagen'],
      precio: data['precio'],
      estado: data['estado'],
    );
  }
}
