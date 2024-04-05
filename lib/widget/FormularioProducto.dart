import 'package:flutter/material.dart';

class FormularioProducto extends StatefulWidget {
  @override
  _FormularioProductoState createState() => _FormularioProductoState();
}

class _FormularioProductoState extends State<FormularioProducto> {
  final _formKey = GlobalKey<FormState>();
  int idCategoria = 0;
  String nombre = '';
  String descripcion = '';
  String imagen = '';
  int precio = 0;
  int estado = 1; // Asumiendo 1 como 'activo'

  Future<void> crearProducto() async {
    if (_formKey.currentState!.validate()) {
      // Lógica para enviar datos a tu API
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Asumiendo que tienes una manera de seleccionar el id de la categoría
          TextFormField(
            decoration: InputDecoration(labelText: 'Nombre del Producto'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese el nombre del producto';
              }
              return null;
            },
            onSaved: (value) => nombre = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Descripción'),
            onSaved: (value) => descripcion = value!,
          ),
          // Añade los campos restantes como 'imagen' y 'precio'
          ElevatedButton(
            onPressed: crearProducto,
            child: Text('Crear Producto'),
          ),
        ],
      ),
    );
  }
}
